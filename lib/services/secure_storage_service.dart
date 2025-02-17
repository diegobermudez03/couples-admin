import 'package:flutter_secure_storage/flutter_secure_storage.dart';


const refreshTokenKey = "refresh_token";

abstract class SecureStorageService {
  void writeValue(String key, String value);
  Future<String?> readValue(String key);
}

class SecureStorageImplementation implements SecureStorageService{
  final FlutterSecureStorage storage;
  SecureStorageImplementation(): storage = const FlutterSecureStorage();

  @override
  Future<String?> readValue(String key) async {
    return storage.read(key: key);
  }

  @override
  void writeValue(String key, String value) {
    storage.write(key: key, value: value);
  }
}