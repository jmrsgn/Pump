import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/utilities/logger_utility.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../domain/usecases/logout_usecase.dart';

class LogoutViewmodel extends StateNotifier<UiState> {
  final LogoutUseCase _logoutUseCase;

  LogoutViewmodel(this._logoutUseCase) : super(UiState.initial());

  Future<void> logout() async {
    // Reset state
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      await _logoutUseCase.execute();
      state = state.copyWith(isLoading: false);
    } catch (e) {
      LoggerUtility.e(
        runtimeType.toString(),
        AppStrings.anUnexpectedErrorOccurred,
      );
      state = state.copyWith(
        isLoading: false,
        errorMessage: AppStrings.anUnexpectedErrorOccurred,
      );
    }
  }
}
