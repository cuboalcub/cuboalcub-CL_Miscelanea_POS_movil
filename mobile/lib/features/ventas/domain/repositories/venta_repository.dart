import '../../data/models/create_venta_request.dart';

abstract class VentaRepository {
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
  });

  Future<List<Map<String, dynamic>>> getVentasPendientesSync();
  Future<void> markVentaSynced(String localId, String backendId);
  Future<void> markVentaFailed(String localId, String? error);
}
