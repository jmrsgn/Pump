import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/features/auth/data/models/auth_response_dto.dart';

import '../../data/models/register_request_dto.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<AuthResponse?> execute(
    String firstName,
    String lastName,
    String email,
    String phone,
    int role,
    String password,
  ) async {
    final request = RegisterRequest(
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: '${AppStrings.phPhonePrefix}$phone',
      role: role,
      profileImageUrl: null,
      password: password,
    );
    return await repository.register(request);
  }
}
