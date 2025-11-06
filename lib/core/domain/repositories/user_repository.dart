import 'package:pump/core/domain/entities/user.dart';
import 'package:pump/core/errors/app_error.dart';

import '../../data/dto/result.dart';

abstract class UserRepository {
  Future<Result<User, AppError>> getCurrentUser();
}
