import 'package:flutter/material.dart';

import '../models/sync_status.dart';
import '../services/sync_status_service.dart';

class SyncStatusIndicator extends StatefulWidget {
  final SyncStatusService syncStatusService;

  const SyncStatusIndicator({
    super.key,
    required this.syncStatusService,
  });

  @override
  State<SyncStatusIndicator> createState() => _SyncStatusIndicatorState();
}

class _SyncStatusIndicatorState extends State<SyncStatusIndicator> {
  SyncStatus _status = SyncStatus.synced;

  @override
  void initState() {
    super.initState();
    _status = widget.syncStatusService.current;
    widget.syncStatusService.statusStream.listen((status) {
      if (mounted) setState(() => _status = status);
    });
  }

  String _tooltip() {
    switch (_status) {
      case SyncStatus.synced:
        return 'Sincronizado';
      case SyncStatus.pending:
        return 'Pendientes por sincronizar';
      case SyncStatus.syncing:
        return 'Sincronizando…';
      case SyncStatus.error:
        return 'Error de sincronización';
    }
  }

  IconData _icon() {
    switch (_status) {
      case SyncStatus.synced:
        return Icons.cloud_done;
      case SyncStatus.pending:
        return Icons.cloud_queue;
      case SyncStatus.syncing:
        return Icons.cloud_sync;
      case SyncStatus.error:
        return Icons.cloud_off;
    }
  }

  Color _color(ThemeData theme) {
    switch (_status) {
      case SyncStatus.synced:
        return Colors.green;
      case SyncStatus.pending:
        return Colors.orange;
      case SyncStatus.syncing:
        return theme.colorScheme.primary;
      case SyncStatus.error:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: _tooltip(),
      child: IconButton(
        icon: Icon(_icon(), color: _color(Theme.of(context))),
        onPressed: () => widget.syncStatusService.refresh(),
      ),
    );
  }
}
