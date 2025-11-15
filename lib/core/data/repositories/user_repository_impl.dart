import 'package:pump/core/constants/app/app_strings.dart';
import 'package:pump/core/domain/entities/authenticated_user.dart';
import 'package:pump/core/errors/app_error.dart';
import 'package:pump/core/utilities/logger_utility.dart';
import 'package:pump/core/utils/secure_storage.dart';
import 'package:pump/core/data/dto/result.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final SecureStorage _secureStorage;

  UserRepositoryImpl({SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? SecureStorage();

  @override
  Future<Result<AuthenticatedUser, AppError>>
  getAuthenticatedCurrentUser() async {
    try {
      // Check for the token
      final token = await _secureStorage.getToken();
      if (token == null || token.isEmpty) {
        LoggerUtility.e(
          runtimeType.toString(),
          "Token is missing, will not proceed with API call",
        );
        return Result.failure(
          AppError(
            error: AppStrings.tokenIsMissing,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }

      // Check for stored user
      final user = await _secureStorage.getCurrentLoggedInUser();
      if (user == null) {
        LoggerUtility.e(runtimeType.toString(), "User is missing");
        return Result.failure(
          AppError(
            error: AppStrings.userIsNotAuthenticated,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }
      return Result.success(AuthenticatedUser(user: user, token: token));
    } catch (e, stackTrace) {
      LoggerUtility.e(
        runtimeType.toString(),
        AppStrings.anUnexpectedErrorOccurred,
        e.toString(),
        stackTrace,
      );
      return Result.failure(
        AppError(
          error: AppStrings.anUnexpectedErrorOccurred,
          message: AppStrings.anUnexpectedErrorOccurred,
        ),
      );
    }
  }
}
