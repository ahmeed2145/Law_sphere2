import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  Future<String?> getValue(String key) {
    return _flutterSecureStorage.read(key: key);
  }

  Future<Map<String, String?>> getAllValue() {
    return _flutterSecureStorage.readAll();
  }

  Future<void> setValue(String key, String value) async {
    await _flutterSecureStorage.write(key: key, value: value);
  }

  Future<void> deleteValue(String key) async {
    await _flutterSecureStorage.delete(key: key);
  }

  Future<void> deleteAllValue() async {
    await _flutterSecureStorage.deleteAll();
  }
}
