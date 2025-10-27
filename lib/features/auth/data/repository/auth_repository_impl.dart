import 'package:pump/features/auth/data/models/login_request_dto.dart';

import '../../domain/repositories/auth_repository.dart';
import '../models/auth_response_dto.dart';
import '../services/auth_service.dart';
import 'package:pump/core/utils/token_storage.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService authService;

  AuthRepositoryImpl(this.authService);

  @override
  Future<AuthResponse?> login(LoginRequest request) async {
    final AuthResponse? authResponse = await authService.login(request);

    // Makes sure token is present
    if (authResponse != null && authResponse.token != null) {
      await TokenStorage.saveToken(authResponse.token!);
    }

    return authResponse;
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
