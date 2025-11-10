import '../repositories/post_repository.dart';

class CreatePostUseCase {
  final PostRepository _postRepository;

  CreatePostUseCase(this._postRepository);

  Future<void> execute() async {
    // await _postRepository.createPost();
  }
}
