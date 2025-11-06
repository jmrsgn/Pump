import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../viewmodels/auth_viewmodel.dart';

// Service
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// Repository
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  return AuthRepositoryImpl(ref.watch(authServiceProvider));
});

// ViewModel
final authViewModelProvider = StateNotifierProvider<AuthViewModel, UiState>((
  ref,
) {
  final repository = ref.watch(authRepositoryProvider);
  final loginUseCase = LoginUseCase(repository);
  final registerUseCase = RegisterUseCase(repository);
  final logoutUseCase = LogoutUseCase(repository);
  return AuthViewModel(loginUseCase, registerUseCase, logoutUseCase);
});
