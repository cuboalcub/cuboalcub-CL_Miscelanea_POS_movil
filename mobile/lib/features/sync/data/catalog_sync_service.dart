import 'package:shared_preferences/shared_preferences.dart';

class CatalogSyncService {
  static const _keyLastProductsSync = 'products_last_sync';

  final SharedPreferences _prefs;

  CatalogSyncService({required SharedPreferences prefs}) : _prefs = prefs;

  Future<DateTime?> getLastProductsSync() async {
    final millis = _prefs.getInt(_keyLastProductsSync);
    if (millis == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(millis);
  }

  Future<void> saveLastProductsSync(DateTime value) async {
    await _prefs.setInt(_keyLastProductsSync, value.millisecondsSinceEpoch);
  }

  Future<void> syncProductsDelta() async {
    print('[CATALOG SYNC] Starting products delta sync');

    final lastSync = await getLastProductsSync();
    if (lastSync != null) {
      print('[CATALOG SYNC] Last sync: $lastSync');
    } else {
      print('[CATALOG SYNC] Last sync: null');
    }

    print('[CATALOG SYNC] Backend delta endpoint not available yet');
    print('[CATALOG SYNC] Sync skipped');
  }
}
