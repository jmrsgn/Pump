import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/posts/domain/usecases/create_post_usecase.dart';
import 'package:pump/features/posts/presentation/providers/create_post_state.dart';

class CreatePostViewModel extends StateNotifier<CreatePostState> {
  final CreatePostUseCase _createPostUseCase;

  CreatePostViewModel(this._createPostUseCase) : super(CreatePostState.initial());

  Future<void> createPost(String title, String body) async {
    // state = CreatePostState.loading();
    // final result = await _createPostUseCase.execute(title, body);
    // result.fold(
    //   (failure) => state = CreatePostState.error(failure.message),
    //   (success) => state = CreatePostState.success(success),
    // );
  }
}
