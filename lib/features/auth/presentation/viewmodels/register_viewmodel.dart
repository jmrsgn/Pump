import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/utilities/logger_utility.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterViewmodel extends StateNotifier<UiState> {
  final RegisterUseCase _registerUseCase;

  RegisterViewmodel(this._registerUseCase) : super(UiState.initial());

  void emitError(String errorMessage) async {
    state = state.copyWith(isLoading: false, errorMessage: errorMessage);
  }

  Future<void> register(
    String firstName,
    String lastName,
    String email,
    String phone,
    int role,
    String password,
  ) async {
    // Reset state
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

    try {
      final response = await _registerUseCase.execute(
        firstName,
        lastName,
        email,
        phone,
        role,
        password,
      );

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
}
