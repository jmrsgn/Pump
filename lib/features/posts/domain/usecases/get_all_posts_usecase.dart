import 'package:pump/core/errors/app_error.dart';
import 'package:pump/features/posts/domain/entities/post.dart';

import '../../../../core/data/dto/result.dart';
import '../repositories/post_repository.dart';

class GetAllPostsUseCase {
  final PostRepository _postRepository;

  GetAllPostsUseCase(this._postRepository);

  Future<Result<List<Post>, AppError>> execute() async {
    return await _postRepository.getAllPosts();
  }
}
