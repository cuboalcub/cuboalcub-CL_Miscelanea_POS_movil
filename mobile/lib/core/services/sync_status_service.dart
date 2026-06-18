import 'dart:async';

import '../database/app_database.dart';
import '../errors/logger.dart';
import '../models/sync_status.dart';

class SyncStatusService {
  final AppDatabase _database;

  final _controller = StreamController<SyncStatus>.broadcast();
  SyncStatus _current = SyncStatus.synced;
  Timer? _pollTimer;
  bool _isRefreshing = false;

  SyncStatusService({required AppDatabase database}) : _database = database;

  Stream<SyncStatus> get statusStream => _controller.stream;
  SyncStatus get current => _current;

  void startMonitoring() {
    refresh();
    _pollTimer = Timer.periodic(const Duration(seconds: 10), (_) => refresh());
  }

  void stopMonitoring() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }

  Future<void> refresh() async {
    if (_isRefreshing) return;
    _isRefreshing = true;
    try {
      final pendingCount = await _database.getPendingOperationsCount();
      final errorCount = await _database.getErrorOperationsCount();

      SyncStatus newStatus;
      if (pendingCount > 0 || errorCount > 0) {
        newStatus = SyncStatus.pending;
      } else {
        newStatus = SyncStatus.synced;
      }

      if (newStatus != _current) {
        _current = newStatus;
        _controller.add(_current);
        AppLogger.info('[SYNC STATUS] Changed to ${_current.name}');
      }
    } catch (e) {
      AppLogger.warning('[SYNC STATUS] Error refreshing: $e');
    } finally {
      _isRefreshing = false;
    }
  }

  void notifySyncing() {
    if (_current != SyncStatus.syncing) {
      _current = SyncStatus.syncing;
      _controller.add(_current);
      AppLogger.info('[SYNC STATUS] Changed to syncing');
    }
  }

  void notifySyncComplete(int syncedCount, int remainingCount) {
    if (remainingCount > 0) {
      _current = SyncStatus.pending;
    } else {
      _current = SyncStatus.synced;
    }
    _controller.add(_current);
    AppLogger.info('[SYNC STATUS] Changed to ${_current.name} (synced: $syncedCount, remaining: $remainingCount)');
  }

  void notifyError() {
    _current = SyncStatus.error;
    _controller.add(_current);
    AppLogger.info('[SYNC STATUS] Changed to error');
  }

  void dispose() {
    _pollTimer?.cancel();
    _controller.close();
  }
}
