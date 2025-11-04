import 'dart:io';

import 'package:pump/core/constants/api/api_messages.dart';
import 'package:pump/core/data/dto/api_error_response.dart';
import 'package:pump/core/data/dto/user_response_dto.dart';
import 'package:pump/core/data/services/user_service.dart';

import '../../domain/repositories/user_repository.dart';
import '../../utils/secure_storage.dart';
import '../dto/result.dart';

class UserRepositoryImpl extends UserRepository {
  final UserService _userService;
  final SecureStorage _secureStorage = SecureStorage();

  UserRepositoryImpl(this._userService);

  @override
  Future<Result<UserResponse>> getCurrentUser() async {
    final token = await _secureStorage.getToken();
    if (token == null) {
      final error = ApiErrorResponse(
        status: HttpStatus.unauthorized,
        error: ApiMessages.tokenIsMissing,
        message: ApiMessages.userIsNotAuthenticated,
      );
      return Result.failure(error); // Use the failure constructor
    }

    final Result<UserResponse> response = await _userService.getCurrentUser(token);
    return response;
  }
}
