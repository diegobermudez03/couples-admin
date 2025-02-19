import 'package:flutter_secure_storage/flutter_secure_storage.dart';


const refreshTokenKey = "refresh_token";

abstract class SecureStorageService {
  void writeValue(String key, String value);
  Future<String?> readValue(String key);
  void deleteValue(String key);
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
  
  @override
  void deleteValue(String key) {
    storage.delete(key: key);
  }
}


class SecureStorageMock implements SecureStorageService{
  final FlutterSecureStorage storage;
  SecureStorageMock(): storage = const FlutterSecureStorage();

  @override
  Future<String?> readValue(String key) async {
    return "OeYgkjy6gUgkvYSfLkTHJH4yq5OE0dGV4WKyiikFu8V1cWcZV7k0je0Lad2dkoXF";
  }

  @override
  void writeValue(String key, String value) {
  }
  
  @override
  void deleteValue(String key) {
  }
}