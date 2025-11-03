// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pump/features/auth/domain/usecases/logout_usecase.dart';
// import '../../data/repositories/auth_repository_impl.dart';
// import '../../data/services/auth_service.dart';
// import '../../domain/usecases/login_usecase.dart';
// import '../../domain/usecases/register_usecase.dart';
// import '../viewmodels/auth_viewmodel.dart';
// import 'auth_state.dart';
//
// // AuthService provider
// final authServiceProvider = Provider<AuthService>((ref) => AuthService());
//
// // AuthRepository provider
// final authRepositoryProvider = Provider<AuthRepositoryImpl>(
//   (ref) => AuthRepositoryImpl(ref.watch(authServiceProvider)),
// );
//
// // AuthViewModel provider
// final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthState>((
//   ref,
// ) {
//   final repositories = ref.watch(authRepositoryProvider);
//   final loginUseCase = LoginUseCase(repositories);
//   final registerUseCase = RegisterUseCase(repositories);
//   final logoutUseCase = LogoutUseCase(repositories);
//   return AuthViewModel(loginUseCase, registerUseCase, logoutUseCase);
// });
