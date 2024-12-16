import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gll/core/data/local/secure_storage/flutter_secure_storage_provider.dart';
import 'Isecure_storage.dart';

final secureStorageProvider = Provider<ISecureStorage>((ref) {
  final FlutterSecureStorage secureStorage = ref.watch(flutterSecureStorageProvider);

  return SecureStorage(secureStorage);
});

final class SecureStorage implements ISecureStorage {
  final FlutterSecureStorage _secureStorage;

  SecureStorage(this._secureStorage);

  @override
  Future<void> delete({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      print('Error deleting key: $key');
      rethrow;
    }
  }

  @override
  Future<String?> read({required String key}) async {
    try{
      return await _secureStorage.read(key: key);
    } catch (e) {
      print('Error reading key: $key');
      rethrow;
    }
  }

  @override
  Future<void> write({required String key, required String value}) async {
    try {
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      print('Error writing key: $key');
      rethrow;
    }
  }
}