import '../entities/sucursal.dart';

abstract class SucursalRepository {
  Future<List<Sucursal>> getSucursalesByUsuario(String usuarioId, {String? empresaId});
}
