import 'package:pump/core/domain/entities/authenticated_user.dart';
import 'package:pump/core/errors/app_error.dart';

import '../../data/dto/result.dart';

abstract class UserRepository {
  Future<Result<AuthenticatedUser, AppError>> getAuthenticatedCurrentUser();
}
