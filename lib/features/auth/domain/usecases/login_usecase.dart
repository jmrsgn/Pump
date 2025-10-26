import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  /// Executes login with username and password
  /// Returns JWT token if successful
  Future<String?> execute(String username, String password) async {
    return await repository.login(username, password);
  }
}
