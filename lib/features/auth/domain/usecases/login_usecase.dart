import '../../data/dto/auth_response_dto.dart';
import '../../data/dto/login_request_dto.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  Future<AuthResponse?> execute(String email, String password) async {
    final request = LoginRequest(email: email, password: password);
    return await _repository.login(request);
  }
}
