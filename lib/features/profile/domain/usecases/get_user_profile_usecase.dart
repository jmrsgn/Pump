import 'package:pump/core/errors/app_error.dart';

import '../../../../core/data/dto/result.dart';
import '../../../../core/domain/entities/user.dart';
import '../../../../core/domain/repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository _userRepository;

  GetUserProfileUseCase(this._userRepository);

  Future<Result<User, AppError>> execute() async {
    return await _userRepository.getCurrentUser();
  }
}
