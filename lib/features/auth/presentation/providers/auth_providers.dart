import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/providers/ui_state.dart';
import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
import '../../data/repository/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../viewmodels/auth_viewmodel.dart';

// AuthService provider
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// AuthRepository provider
final authRepositoryProvider = Provider<AuthRepositoryImpl>(
  (ref) => AuthRepositoryImpl(ref.watch(authServiceProvider)),
);

// AuthViewModel provider
final authViewModelProvider = StateNotifierProvider<AuthViewModel, UiState>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  final loginUseCase = LoginUseCase(repository);
  final registerUseCase = RegisterUseCase(repository);
  final logoutUseCase = LogoutUseCase(repository);
  return AuthViewModel(loginUseCase, registerUseCase, logoutUseCase);
});
