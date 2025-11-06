import 'package:pump/core/constants/app/app_strings.dart';
import 'package:pump/core/data/services/user_service.dart';
import 'package:pump/core/domain/entities/user.dart';
import 'package:pump/core/errors/app_error.dart';
import 'package:pump/core/utils/secure_storage.dart';
import 'package:pump/core/data/dto/result.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserService _userService;
  final SecureStorage _secureStorage;

  UserRepositoryImpl(this._userService, {SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? SecureStorage();

  @override
  Future<Result<User, AppError>> getCurrentUser() async {
    try {
      final token = await _secureStorage.getToken();
      if (token == null || token.isEmpty) {
        return Result.failure(
          AppError(
            error: AppStrings.tokenIsMissing,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }

      final result = await _userService.getCurrentUser(token);

      if (result.isSuccess && result.data != null) {
        return Result.success(result.data!.toUser());
      }

      return Result.failure(
        AppError(
          error: result.error?.error ?? AppStrings.unknownError,
          message: result.error?.message ?? AppStrings.failedToFetchUserData,
        ),
      );
    } catch (e, stackTrace) {
      return Result.failure(
        AppError(
          error: AppStrings.unknownError,
          message: e.toString(),
          stackTrace: stackTrace,
        ),
      );
    }
  }
}
