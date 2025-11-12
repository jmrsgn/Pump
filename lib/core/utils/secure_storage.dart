import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Singleton instance
  static final SecureStorage _instance = SecureStorage._internal();
  factory SecureStorage() => _instance;
  SecureStorage._internal();
  static const _tokenKey = 'jwt_token';
  static const _currentLoggedInUserId = 'current_logged_in_user_id';

  final FlutterSecureStorage _storage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> saveCurrentLoggedInUserId(String userId) async {
    await _storage.write(key: _currentLoggedInUserId, value: userId);
  }

  Future<String?> getCurrentLoggedInUserId() async {
    return await _storage.read(key: _currentLoggedInUserId);
  }

  Future<void> deleteCurrentLoggedInUserId() async {
    await _storage.delete(key: _currentLoggedInUserId);
  }
}
