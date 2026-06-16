import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../../domain/entities/auth_result.dart';

class SessionManager {
  AuthResult? _cachedSession;

  Future<File> get _file async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/session.json');
  }

  Future<void> saveSession(AuthResult session) async {
    _cachedSession = session;
    final file = await _file;
    await file.writeAsString(jsonEncode({
      'token': session.token,
      'empresa_id': session.empresaId,
      'usuario_id': session.usuarioId,
    }));
  }

  Future<AuthResult?> getSession() async {
    if (_cachedSession != null) return _cachedSession;
    try {
      final file = await _file;
      if (!await file.exists()) return null;
      final data = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      _cachedSession = AuthResult(
        token: data['token'] as String,
        empresaId: data['empresa_id'] as int,
        usuarioId: data['usuario_id'] as int,
      );
      return _cachedSession;
    } catch (e) {
      return null;
    }
  }

  Future<void> clearSession() async {
    _cachedSession = null;
    final file = await _file;
    if (await file.exists()) {
      await file.delete();
    }
  }
}
