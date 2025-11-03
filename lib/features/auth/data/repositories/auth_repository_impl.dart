import 'package:pump/core/utils/secure_storage.dart';

import '../../../../core/dao/user_dao.dart';
import '../../domain/repositories/auth_repository.dart';
import '../dto/auth_response_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/register_request_dto.dart';
import '../dto/user_response_dto.dart';
import '../services/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final SecureStorage _secureStorage = SecureStorage();
  final UserDao _userDao;

  AuthRepositoryImpl(this._authService, this._userDao);

  @override
  Future<AuthResponse?> login(LoginRequest request) async {
    final AuthResponse? authResponse = await _authService.login(request);

    // Makes sure token is present
    if (authResponse != null && authResponse.token != null) {
      await _secureStorage.saveToken(authResponse.token!);
    }

    // Save current logged in profile
    final UserResponse userResponse = authResponse!.userResponse!;
    await _secureStorage.saveCurrentLoggedInUserEmail(userResponse.email!);

    return authResponse;
  }

  @override
  Future<AuthResponse?> register(RegisterRequest request) {
    return _authService.register(request);
  }

  @override
  Future<String?> getSavedToken() async {
    return _secureStorage.getToken();
  }

  @override
  Future<void> logout() async {
    await _secureStorage.deleteCurrentLoggedInUserEmail();
    await _secureStorage.deleteToken();
  }
}
