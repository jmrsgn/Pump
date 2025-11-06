import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/core/presentation/providers/user_state.dart';
import 'package:pump/features/profile/domain/usecases/get_user_profile_usecase.dart';

import '../../data/repositories/user_repository_impl.dart';
import '../../data/services/user_service.dart';
import '../viewmodels/user_viewmodel.dart';

// Service
final userServiceProvider = Provider<UserService>((ref) => UserService());

// Repository
final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(ref.watch(userServiceProvider));
});

// ViewModel
final userViewModelProvider = StateNotifierProvider<UserViewModel, UserState>((
  ref,
) {
  final repo = ref.watch(userRepositoryProvider);
  final getUserProfileUseCase = GetUserProfileUseCase(repo);
  return UserViewModel(getUserProfileUseCase);
});
