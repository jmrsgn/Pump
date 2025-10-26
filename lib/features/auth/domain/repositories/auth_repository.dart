abstract class AuthRepository {
  Future<String?> login(String email, String password);

  Future<String?> getSavedToken();

  Future<void> logout();
}
