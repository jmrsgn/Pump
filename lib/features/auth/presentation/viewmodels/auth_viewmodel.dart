import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/constants/app_strings.dart';
import 'package:pump/core/providers/ui_state.dart';
import '../../data/dto/auth_response_dto.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

class AuthViewModel extends StateNotifier<UiState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  AuthViewModel(this._loginUseCase, this._registerUseCase, this._logoutUseCase)
    : super(UiState.initial());

  void emitError(String errorMessage) async {
    state = state.copyWith(isLoading: false, errorMessage: errorMessage);
  }

  /// Shared async executor
  Future<void> _execute(Future<AuthResponse?> Function() action) async {
    try {
      final response = await action();

      if (response == null) {
        emitError(AppStrings.invalidCredentials);
      } else {
        state = state.copyWith(
          isLoading: false,
          errorMessage: response.errorMessage,
        );
      }
    } catch (e) {
      emitError(e.toString());
    }
  }

  /// Login
  Future<void> login(String username, String password) async {
    // Reset previous errors
    state = state.copyWith(isLoading: true, errorMessage: null);

    if (username.trim().isEmpty || password.trim().isEmpty) {
      emitError(AppStrings.usernameAndPasswordAreRequired);
      return;
    }

    await _execute(() => _loginUseCase.execute(username, password));
  }

  /// Register
  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String phone,
    int role,
    String password,
  ) async {
    if ([
      firstName,
      lastName,
      email,
      phone,
      password,
    ].any((e) => e.trim().isEmpty)) {
      emitError(AppStrings.allFieldsAreRequired);
      return;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);
    await _execute(
      () => _registerUseCase.execute(
        firstName,
        lastName,
        email,
        phone,
        role,
        password,
      ),
    );
  }

  /// Logout
  Future<void> logout() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _logoutUseCase.execute();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      emitError(e.toString());
    }
  }
}
