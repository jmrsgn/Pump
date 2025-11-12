import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pump/features/posts/data/services/post_service.dart';
import 'package:pump/features/posts/domain/usecases/create_post_usecase.dart';
import 'package:pump/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:pump/features/posts/presentation/providers/create_post_state.dart';
import 'package:pump/features/posts/presentation/providers/main_feed_state.dart';
import 'package:pump/features/posts/presentation/viewmodels/create_post_viewmodel.dart';
import 'package:pump/features/posts/presentation/viewmodels/main_feed_viewmodel.dart';
import '../../data/repositories/post_repository_impl.dart';

final postServiceProvider = Provider<PostService>((ref) => PostService());

final postRepositoryProvider = Provider<PostRepositoryImpl>(
  (ref) => PostRepositoryImpl(ref.watch(postServiceProvider)),
);

// Create Post
final createPostUseCaseProvider = Provider<CreatePostUseCase>(
  (ref) => CreatePostUseCase(ref.watch(postRepositoryProvider)),
);

final createPostViewModelProvider =
    StateNotifierProvider<CreatePostViewModel, CreatePostState>((ref) {
      return CreatePostViewModel(ref.watch(createPostUseCaseProvider));
    });

// Main Feed
final getAllPostsUseCaseProvider = Provider<GetAllPostsUseCase>(
  (ref) => GetAllPostsUseCase(ref.watch(postRepositoryProvider)),
);

final mainFeedViewModelProvider =
    StateNotifierProvider<MainFeedViewmodel, MainFeedState>((ref) {
      return MainFeedViewmodel(ref.watch(getAllPostsUseCaseProvider));
    });
