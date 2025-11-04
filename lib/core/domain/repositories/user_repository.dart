import 'package:pump/core/data/dto/result.dart';
import 'package:pump/core/data/dto/user_response_dto.dart';

abstract class UserRepository {
  Future<Result<UserResponse>> getCurrentUser();
}
