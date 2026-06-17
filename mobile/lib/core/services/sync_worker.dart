import 'dart:async';

import '../errors/logger.dart';

typedef SyncCallback = Future<int> Function();

class SyncWorker {
  SyncCallback? _syncCallback;
  Timer? _periodicTimer;
  bool _isRunning = false;

  static const defaultInterval = Duration(minutes: 5);

  void registerSyncCallback(SyncCallback callback) {
    _syncCallback = callback;
  }

  void startPeriodicSync({Duration interval = defaultInterval}) {
    _periodicTimer?.cancel();
    _periodicTimer = Timer.periodic(interval, (_) {
      triggerSync();
    });
    AppLogger.info('[SYNC WORKER] Periodic sync started (interval: ${interval.inMinutes}min)');
  }

  void stopPeriodicSync() {
    _periodicTimer?.cancel();
    _periodicTimer = null;
    AppLogger.info('[SYNC WORKER] Periodic sync stopped');
  }

  Future<void> triggerSync() async {
    if (_isRunning) {
      AppLogger.info('[SYNC WORKER] Sync already running, skipping');
      return;
    }

    if (_syncCallback == null) {
      AppLogger.warning('[SYNC WORKER] No sync callback registered');
      return;
    }

    _isRunning = true;
    try {
      final synced = await _syncCallback!();
      if (synced > 0) {
        AppLogger.info('[SYNC WORKER] Synced $synced operations');
      }
    } catch (e) {
      AppLogger.error('[SYNC WORKER] Sync failed: $e');
    } finally {
      _isRunning = false;
    }
  }

  bool get isRunning => _isRunning;

  void dispose() {
    stopPeriodicSync();
    _syncCallback = null;
  }
}
