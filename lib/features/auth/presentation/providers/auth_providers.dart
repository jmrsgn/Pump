import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
import '../../../../core/presentation/providers/database_providers.dart';
import '../../../../core/presentation/providers/ui_state.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../data/services/auth_service.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import '../viewmodels/auth_viewmodel.dart';

// AuthService provider
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

// AuthRepository provider
final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final userDaoAsync = ref.watch(userDaoProvider);

  // Return a temporary placeholder until DB is ready
  if (userDaoAsync is AsyncLoading) {
    throw Exception("Database not initialized yet");
  }

  final userDao = userDaoAsync.value;
  if (userDao == null) throw Exception("UserDao not ready");

  return AuthRepositoryImpl(ref.watch(authServiceProvider), userDao);
});

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
