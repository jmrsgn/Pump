import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
import 'package:pump/features/auth/presentation/viewmodels/logout_viewmodel.dart';
import 'package:pump/features/auth/presentation/viewmodels/register_viewmodel.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../viewmodels/login_viewmodel.dart';

// Service
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// Repository
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl(ref.watch(authServiceProvider));
});

// Login ViewModel
final loginViewModelProvider = StateNotifierProvider<LoginViewModel, UiState>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  final loginUseCase = LoginUseCase(repository);
  return LoginViewModel(loginUseCase);
});

// Register ViewModel
final registerViewModelProvider =
    StateNotifierProvider<RegisterViewmodel, UiState>((ref) {
      final repository = ref.watch(authRepositoryProvider);
      final registerUseCase = RegisterUseCase(repository);
      return RegisterViewmodel(registerUseCase);
    });

// Logout ViewModel
final logoutViewModelProvider = StateNotifierProvider<LogoutViewmodel, UiState>(
  (ref) {
    final repository = ref.watch(authRepositoryProvider);
    final logoutUseCase = LogoutUseCase(repository);
    return LogoutViewmodel(logoutUseCase);
  },
);
