import 'package:pump/features/auth/data/models/auth_response_dto.dart';
import 'package:pump/features/auth/data/models/login_request_dto.dart';

abstract class AuthRepository {
  Future<AuthResponse?> login(LoginRequest request);

  Future<String?> getSavedToken();

  Future<void> logout();
}
