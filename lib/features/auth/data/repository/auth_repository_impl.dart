import 'package:pump/core/utils/token_storage.dart';
import 'package:pump/features/auth/domain/entities/user.dart';

import '../../../../core/dao/user_dao.dart';
import '../../domain/repositories/auth_repository.dart';
import '../dto/auth_response_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/register_request_dto.dart';
import '../dto/user_response_dto.dart';
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

    // final UserResponse userResponse = authResponse!.userResponse!;
    // final user = User(
    //   firstName: userResponse.firstName == null ? "" : userResponse.firstName!,
    //   lastName: userResponse.lastName!,
    //   email: userResponse.email!,
    //   phone: userResponse.phone!,
    //   role: userResponse.role!,
    // );
    // await _userDao.insertUser(user.toEntity());

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
