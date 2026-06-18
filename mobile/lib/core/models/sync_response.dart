class SyncConflict {
  final String entidad;
  final String id;
  final String serverUpdatedAt;
  final String clientUpdatedAt;
  final Map<String, dynamic>? serverVersion;

  const SyncConflict({
    required this.entidad,
    required this.id,
    required this.serverUpdatedAt,
    required this.clientUpdatedAt,
    this.serverVersion,
  });

  factory SyncConflict.fromJson(Map<String, dynamic> json) {
    return SyncConflict(
      entidad: json['entidad'] as String? ?? '',
      id: json['id'] as String? ?? '',
      serverUpdatedAt: json['server_updated_at'] as String? ?? '',
      clientUpdatedAt: json['client_updated_at'] as String? ?? '',
      serverVersion: json['server_version'] as Map<String, dynamic>?,
    );
  }

  bool get clientWins {
    final server = DateTime.tryParse(serverUpdatedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
    final client = DateTime.tryParse(clientUpdatedAt) ?? DateTime.fromMillisecondsSinceEpoch(0);
    return client.isAfter(server);
  }
}

class SyncResponse {
  final int synced;
  final List<SyncConflict> conflicts;

  const SyncResponse({
    required this.synced,
    required this.conflicts,
  });

  factory SyncResponse.fromJson(Map<String, dynamic> json) {
    final conflictsList = (json['conflicts'] as List<dynamic>?)
            ?.map((c) => SyncConflict.fromJson(c as Map<String, dynamic>))
            .toList() ??
        [];
    return SyncResponse(
      synced: json['synced'] as int? ?? 0,
      conflicts: conflictsList,
    );
  }
}
