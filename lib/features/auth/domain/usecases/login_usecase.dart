import 'package:pump/features/auth/data/models/auth_response_dto.dart';

import '../../data/models/login_request_dto.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<AuthResponse?> execute(String username, String password) async {
    final request = LoginRequest(username: username, password: password);
    return await repository.login(request);
  }
}
