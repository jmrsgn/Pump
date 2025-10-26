import '../../domain/repositories/auth_repository.dart';
import '../services/auth_service.dart';
import 'package:pump/core/utils/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<String?> login(String username, String password) async {
    final token = await authService.login(username, password);
    if (token != null) {
      await TokenStorage.saveToken(token);
    }
    return token;
  }

  @override
  Future<String?> getSavedToken() async {
    return TokenStorage.getToken();
  }

  @override
  Future<void> logout() async {
    await TokenStorage.deleteToken();
  }
}
