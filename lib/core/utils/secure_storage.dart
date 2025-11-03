import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Singleton instance
  static final SecureStorage _instance = SecureStorage._internal();
  factory SecureStorage() => _instance;
  SecureStorage._internal();
  static const _tokenKey = 'jwt_token';
  static const _currentLoggedInUserEmailKey = 'current_logged_in_user_email';

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

  Future<void> saveCurrentLoggedInUserEmail(String userEmail) async {
    await _storage.write(key: _currentLoggedInUserEmailKey, value: userEmail);
  }

  Future<String?> getCurrentLoggedInUserEmail() async {
    return await _storage.read(key: _currentLoggedInUserEmailKey);
  }

  Future<void> deleteCurrentLoggedInUserEmail() async {
    await _storage.delete(key: _currentLoggedInUserEmailKey);
  }
}
