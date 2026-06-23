import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/domain/entities/auth_result.dart';
import '../errors/logger.dart';

class SessionManager {
  AuthResult? _session;
  final Dio _dio;
  final SharedPreferences? _prefs;

  static const _keyToken = 'session_token';
  static const _keyEmpresaId = 'session_empresa_id';
  static const _keyUsuarioId = 'session_usuario_id';
  static const _keySucursalId = 'session_sucursal_id';
  static const _keySucursalNombre = 'session_sucursal_nombre';

  SessionManager({required Dio dio, SharedPreferences? prefs})
      : _dio = dio,
        _prefs = prefs;

  AuthResult? get session => _session;

  bool get isLoggedIn => _session?.token != null;

  bool get hasSucursal => _isValidUuid(_session?.activeSucursalId);

  String get sucursalNombre => _prefs?.getString(_keySucursalNombre) ?? '';

  Future<void> saveSession(AuthResult session) async {
    _session = session;
    await _persistSession(session);
  }

  Future<AuthResult?> getSession() async {
    if (_session != null) return _session;
    return await _restoreSession();
  }

  Future<void> clearSession() async {
    _session = null;
    await _clearPersistedSession();
  }

  Future<void> saveActiveSucursalId(String sucursalId, {String nombre = ''}) async {
    if (_session == null) return;

    _session = AuthResult(
      token: _session!.token,
      empresaId: _session!.empresaId,
      usuarioId: _session!.usuarioId,
      activeSucursalId: sucursalId,
    );

    await _prefs?.setString(_keySucursalId, sucursalId);
    await _prefs?.setString(_keySucursalNombre, nombre);
    AppLogger.info('[SESSION] Saved activeSucursalId: $sucursalId, nombre: $nombre');
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

      await _persistSession(_session!);
      AppLogger.info('[SESSION] Auto-assigned sucursal: $sucursalId');
    } on DioException catch (e) {
      AppLogger.warning('[SESSION] Failed to fetch sucursales: ${e.message}');
    } catch (e) {
      AppLogger.warning('[SESSION] Unexpected error fetching sucursales: $e');
    }
  }

  Future<void> _persistSession(AuthResult session) async {
    if (_prefs == null) return;
    await _prefs!.setString(_keyToken, session.token);
    await _prefs!.setString(_keyEmpresaId, session.empresaId);
    await _prefs!.setString(_keyUsuarioId, session.usuarioId);
    await _prefs!.setString(_keySucursalId, session.activeSucursalId);
  }

  Future<AuthResult?> _restoreSession() async {
    if (_prefs == null) return null;

    final token = _prefs!.getString(_keyToken);
    if (token == null || token.isEmpty) return null;

    final empresaId = _prefs!.getString(_keyEmpresaId) ?? '';
    final usuarioId = _prefs!.getString(_keyUsuarioId) ?? '';
    final sucursalId = _prefs!.getString(_keySucursalId) ?? '';

    _session = AuthResult(
      token: token,
      empresaId: empresaId,
      usuarioId: usuarioId,
      activeSucursalId: sucursalId,
    );

    AppLogger.info('[SESSION] Restored session from SharedPreferences');
    return _session;
  }

  Future<void> _clearPersistedSession() async {
    if (_prefs == null) return;
    await _prefs!.remove(_keyToken);
    await _prefs!.remove(_keyEmpresaId);
    await _prefs!.remove(_keyUsuarioId);
    await _prefs!.remove(_keySucursalId);
    await _prefs!.remove(_keySucursalNombre);
  }

  static bool _isValidUuid(String? value) {
    if (value == null || value.isEmpty) return false;
    return RegExp(r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$')
        .hasMatch(value);
  }
}
