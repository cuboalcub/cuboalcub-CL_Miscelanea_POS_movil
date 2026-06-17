import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/errors/logger.dart';
import '../../../../core/services/sync_service.dart';
import '../models/create_venta_request.dart';
import '../../domain/repositories/venta_repository.dart';

class VentaRepositoryImpl implements VentaRepository {
  final AppDatabase _database;
  final SyncService _syncService;
  static const _uuid = Uuid();

  VentaRepositoryImpl({
    required AppDatabase database,
    required SyncService syncService,
  })  : _database = database,
        _syncService = syncService;

  @override
  Future<String> confirmarVenta({
    required String empresaId,
    required String usuarioId,
    String? sucursalId,
    required String formaPago,
    required String metodoPago,
    required String usoCfdi,
    required List<CreateVentaItemRequest> items,
    required double subtotal,
    required double iva,
    required double total,
  }) async {
    final ventaId = _uuid.v4();
    final now = DateTime.now();

    final request = CreateVentaRequest(
      clienteId: null,
      sucursalId: sucursalId,
      formaPago: formaPago,
      metodoPago: metodoPago,
      usoCfdi: usoCfdi,
      items: items,
    );

    final ventaCompanion = VentasLocalTableCompanion.insert(
      id: ventaId,
      empresaId: empresaId,
      usuarioId: usuarioId,
      sucursalId: Value(sucursalId),
      formaPago: formaPago,
      metodoPago: metodoPago,
      usoCfdi: usoCfdi,
      subtotal: subtotal,
      iva: iva,
      total: total,
      payloadJson: jsonEncode(request.toJson()),
      createdAt: now,
      updatedAt: now,
    );

    final itemCompanions = items.map((item) {
      return VentaItemsLocalTableCompanion.insert(
        id: _uuid.v4(),
        ventaId: ventaId,
        productoId: item.productoId,
        productoNombre: '',
        cantidad: item.cantidad,
        precioUnitario: item.precioUnitario,
        subtotal: item.precioUnitario * item.cantidad,
      );
    }).toList();

    await _database.saveVentaCompleta(ventaCompanion, itemCompanions);
    AppLogger.info('[VENTA REPO] Venta $ventaId saved locally');

    await _syncService.queueOperation(
      entidad: 'ventas',
      tipo: 'insertar',
      payload: {
        'venta_local_id': ventaId,
        ...request.toJson(),
      },
    );

    AppLogger.info('[VENTA REPO] Venta $ventaId queued for sync');
    return ventaId;
  }

  @override
  Future<List<Map<String, dynamic>>> getVentasPendientesSync() async {
    final ventas = await _database.getVentasPendientesSync();
    return ventas.map<Map<String, dynamic>>((v) {
      return {
        'id': v.id,
        'payload': jsonDecode(v.payloadJson),
        'created_at': v.createdAt.toIso8601String(),
      };
    }).toList();
  }

  @override
  Future<void> markVentaSynced(String localId, String backendId) async {
    await _database.markVentaSynced(localId, backendId);
  }

  @override
  Future<void> markVentaFailed(String localId, String? error) async {
    await _database.markVentaFailed(localId, error);
  }
}
