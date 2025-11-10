import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/errors/app_error.dart';
import 'package:pump/core/utilities/logger_utility.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/data/dto/result.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../data/dto/auth_response_dto.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';

// TODO: separate to LoginViewModel and RegisterViewModel

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
  Future<void> _execute(
    Future<Result<AuthResponse, AppError>> Function() action,
  ) async {
    try {
      final response = await action();
      if (response.isSuccess) {
        state = state.copyWith(isLoading: false, errorMessage: null);
      } else {
        LoggerUtility.d(runtimeType.toString(), response.error);
        emitError(response.error!.message);
      }
    } catch (e, stackTrace) {
      LoggerUtility.e(
        runtimeType.toString(),
        AppStrings.anUnexpectedErrorOccurred,
        e.toString(),
        stackTrace,
      );
      emitError(AppStrings.anUnexpectedErrorOccurred);
    }
  }

  /// Login
  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    if (email.trim().isEmpty || password.trim().isEmpty) {
      emitError(AppStrings.emailAndPasswordAreRequired);
      return;
    }

    await _execute(() => _loginUseCase.execute(email, password));
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
    state = state.copyWith(isLoading: true, errorMessage: null);

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
    // Reset previous errors
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _logoutUseCase.execute();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      emitError(e.toString());
    }
  }
}
