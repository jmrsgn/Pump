import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/auth/domain/usecases/login_usecase.dart';
import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
import 'package:pump/features/auth/domain/usecases/register_usecase.dart';
import '../../../../core/constants/app_strings.dart';
import '../providers/auth_state.dart';

class AuthViewModel extends StateNotifier<AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthViewModel(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
    : super(AuthState.initial());

  Future<void> login(String username, String password) async {
    // Reset previous errors
    state = state.copyWith(errorMessage: null, isLoading: true);

    // Validation
    if (username.isEmpty || password.isEmpty) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: AppStrings.usernameAndPasswordAreRequired,
      );
      return;
    }

    try {
      final response = await _loginUseCase.execute(username, password);

      if (response == null) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: AppStrings.invalidCredentials,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          authResponse: response,
          errorMessage: response.errorMessage,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String phone,
    int role,
    String password,
  ) async {
    // Reset previous errors
    state = state.copyWith(errorMessage: null, isLoading: true);

    // Validation
    if ([firstName, lastName, email, phone, password].any((e) => e.isEmpty)) {
      state = state.copyWith(
        isLoading: false,
        errorMessage: AppStrings.allFieldsAreRequired,
      );
      return;
    }

    try {
      final response = await _registerUseCase.execute(
        firstName,
        lastName,
        email,
        phone,
        role,
        password,
      );

      if (response == null) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: AppStrings.invalidCredentials,
        );
      } else {
        state = state.copyWith(
          isLoading: false,
          authResponse: response,
          errorMessage: response.errorMessage,
        );
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> logout() async {
    // Reset previous errors
    state = state.copyWith(errorMessage: null, isLoading: true);

    try {
      await _logoutUseCase.execute();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  /// Resets the state to its initial values
  void resetState() {
    state = AuthState.initial();
  }
}
