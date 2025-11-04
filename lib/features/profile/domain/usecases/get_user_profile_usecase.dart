import 'package:pump/core/data/dto/result.dart';
import 'package:pump/core/data/dto/user_response_dto.dart';

import '../../../../core/domain/repositories/user_repository.dart';

class GetUserProfileUseCase {
  final UserRepository _userRepository;

  GetUserProfileUseCase(this._userRepository);

  Future<Result<UserResponse>> execute() async {
    return await _userRepository.getCurrentUser();
  }
}
