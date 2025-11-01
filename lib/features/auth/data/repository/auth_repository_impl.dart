import 'package:pump/core/utils/token_storage.dart';
import 'package:pump/features/auth/data/models/login_request_dto.dart';
import 'package:pump/features/auth/data/models/register_request_dto.dart';

import '../../domain/repositories/auth_repository.dart';
import '../models/auth_response_dto.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final TokenStorage _storage = TokenStorage();

  AuthRepositoryImpl(this._authService);

  @override
  Future<AuthResponse?> login(LoginRequest request) async {
    final AuthResponse? authResponse = await _authService.login(request);

    // Makes sure token is present
    if (authResponse != null && authResponse.token != null) {
      await _storage.saveToken(authResponse.token!);
    }

    return authResponse;
  }

  @override
  Future<AuthResponse?> register(RegisterRequest request) {
    return _authService.register(request);
  }

  @override
  Future<String?> getSavedToken() async {
    return _storage.getToken();
  }

  @override
  Future<void> logout() async {
    await _storage.deleteToken();
  }
}
