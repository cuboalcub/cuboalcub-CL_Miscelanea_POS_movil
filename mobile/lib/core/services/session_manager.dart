import 'package:dio/dio.dart';

import '../../features/auth/domain/entities/auth_result.dart';
import '../errors/logger.dart';

class SessionManager {
  AuthResult? _session;
  final Dio _dio;

  SessionManager({required Dio dio}) : _dio = dio;

  AuthResult? get session => _session;

  bool get isLoggedIn => _session?.token != null;

  bool get hasSucursal => _isValidUuid(_session?.activeSucursalId);

  Future<void> saveSession(AuthResult session) async {
    _session = session;
  }

  Future<AuthResult?> getSession() async {
    return _session;
  }

  Future<void> clearSession() async {
    _session = null;
  }

  Future<void> ensureSucursal() async {
    if (_session == null) return;
    if (_isValidUuid(_session!.activeSucursalId)) return;

    try {
      final empresaId = _session!.empresaId;
      if (!_isValidUuid(empresaId)) {
        AppLogger.warning('[SESSION] No valid empresaId, cannot fetch sucursales');
        return;
      }

      final headers = <String, String>{
        'Content-Type': 'application/json',
      };
      if (_session!.token.isNotEmpty) {
        headers['Authorization'] = 'Bearer ${_session!.token}';
      }

      final response = await _dio.get(
        '/sucursales',
        options: Options(headers: headers),
      );

      final data = response.data;
      final all = (data is List) ? data : (data['sucursales'] as List<dynamic>?) ?? [];
      AppLogger.info('[SESSION] Loaded ${all.length} sucursales from backend');

      final filtered = all.where((s) =>
        s['empresa_id']?.toString() == empresaId
      ).toList();
      AppLogger.info('[SESSION] Filtered ${filtered.length} sucursales for empresa $empresaId');

      if (filtered.isEmpty) {
        AppLogger.warning('[SESSION] No sucursales found for empresa $empresaId');
        return;
      }

      final firstSucursal = filtered.first;
      final sucursalId = firstSucursal['id']?.toString() ?? firstSucursal['sucursal_id']?.toString() ?? '';

      if (!_isValidUuid(sucursalId)) {
        AppLogger.warning('[SESSION] First sucursal has invalid id: $sucursalId');
        return;
      }

      _session = AuthResult(
        token: _session!.token,
        empresaId: _session!.empresaId,
        usuarioId: _session!.usuarioId,
        activeSucursalId: sucursalId,
      );

      AppLogger.info('[SESSION] Auto-assigned sucursal: $sucursalId');
    } on DioException catch (e) {
      AppLogger.warning('[SESSION] Failed to fetch sucursales: ${e.message}');
    } catch (e) {
      AppLogger.warning('[SESSION] Unexpected error fetching sucursales: $e');
    }
  }

  static bool _isValidUuid(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
        .hasMatch(value);
  }
}