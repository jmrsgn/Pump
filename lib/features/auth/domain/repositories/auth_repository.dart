import '../../data/dto/auth_response_dto.dart';
import '../../data/dto/login_request_dto.dart';
import '../../data/dto/register_request_dto.dart';

abstract class AuthRepository {
  Future<AuthResponse?> login(LoginRequest request);

  Future<AuthResponse?> register(RegisterRequest request);

  Future<String?> getSavedToken();

  Future<void> logout();
}
