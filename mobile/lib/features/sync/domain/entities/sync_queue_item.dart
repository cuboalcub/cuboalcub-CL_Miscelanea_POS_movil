import 'package:equatable/equatable.dart';

class SyncQueueItem extends Equatable {
  final String id;
  final String entidad;
  final String tipo;
  final Map<String, dynamic> payload;
  final String status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? lastError;

  const SyncQueueItem({
    required this.id,
    required this.entidad,
    required this.tipo,
    required this.payload,
    this.status = 'pending',
    this.retryCount = 0,
    required this.createdAt,
    required this.updatedAt,
    this.lastError,
  });

  @override
  List<Object?> get props => [
        id, entidad, tipo, payload,
        status, retryCount, createdAt, updatedAt, lastError,
      ];
}
