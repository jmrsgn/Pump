
import '../../domain/repositories/user_repository.dart';
import '../../utils/secure_storage.dart';

class UserRepositoryImpl extends UserRepository {
  final SecureStorage _secureStorage = SecureStorage();

  @override
  Future<void> getUser(String email) async {
    final token = await _secureStorage.getToken();
    if (token == null) {
      return;
    }

    return;
  }
}