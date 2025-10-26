import 'package:flutter/foundation.dart';
import '../../domain/usecases/login_usecase.dart';

class AuthViewModel extends ChangeNotifier {
  final LoginUseCase loginUseCase;

  bool isLoading = false;
  String? errorMessage;
  String? token;

  AuthViewModel(this.loginUseCase);

  Future<void> login(String username, String password) async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      token = await loginUseCase.execute(username, password);
      if (token == null) {
        errorMessage = 'Invalid credentials';
      }
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
