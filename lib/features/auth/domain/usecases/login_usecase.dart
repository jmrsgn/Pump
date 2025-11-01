import 'package:pump/features/auth/data/models/auth_response_dto.dart';

import '../../data/models/login_request_dto.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<AuthResponse?> execute(String username, String password) async {
    final request = LoginRequest(email: username, password: password);
    return await _repository.login(request);
  }
}
