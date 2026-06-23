import '../../../../core/errors/logger.dart';
import '../../domain/entities/sucursal.dart';
import '../../domain/repositories/sucursal_repository.dart';
import '../datasources/sucursal_api_service.dart';

class SucursalRepositoryImpl implements SucursalRepository {
  final SucursalApiService _apiService;

  SucursalRepositoryImpl({required SucursalApiService apiService})
      : _apiService = apiService;

  @override
  Future<List<Sucursal>> getSucursalesByUsuario(String usuarioId, {String? empresaId}) async {
    try {
      final perfiles = await _apiService.getPerfilesByUsuario(usuarioId, empresaId: empresaId);

      final perfilesActivosConSucursal = perfiles.where((p) =>
          p.activo && p.sucursalId != null && p.sucursalId!.isNotEmpty);

      AppLogger.info('[SUCURSAL REPO] ${perfiles.length} perfiles totales, '
          '${perfilesActivosConSucursal.length} activos con sucursal');

      final sucursales = <Sucursal>[];
      for (final perfil in perfilesActivosConSucursal) {
        try {
          final sucursalModel = await _apiService.getSucursal(perfil.sucursalId!);
          sucursales.add(sucursalModel.toEntity());
        } catch (e) {
          AppLogger.warning('[SUCURSAL REPO] Error getting sucursal '
              '${perfil.sucursalId}: $e');
        }
      }

      return sucursales;
    } catch (e) {
      AppLogger.error('[SUCURSAL REPO] Error getting sucursales by usuario: $e');
      rethrow;
    }
  }
}
