import 'package:flutter/foundation.dart';
import 'package:pump/features/auth/data/models/auth_response_dto.dart';
import '../../../../core/constants/app_strings.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  bool isLoading = false;
  String? message;
  AuthResponse? authResponse;

  AuthViewModel(this.loginUseCase);

  Future<void> login(String username, String password) async {
    message = null;

    if (username.isEmpty || password.isEmpty) {
      message = AppStrings.usernameAndPasswordAreRequired;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      authResponse = await loginUseCase.execute(username, password);
      if (authResponse == null) {
        message = AppStrings.invalidCredentials;
      } else {
        message = authResponse?.authMessage;
      }
    } catch (e) {
      message = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> register(
    String firstName,
    String lastName,
    String username,
    String email,
    String phone,
    int role,
    String profileImageUrl,
    String password,
  ) async {
    // TODO:
  }
}
