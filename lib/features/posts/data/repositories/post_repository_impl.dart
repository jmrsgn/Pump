import 'package:pump/core/data/dto/result.dart';
import 'package:pump/core/errors/app_error.dart';
import 'package:pump/core/utils/secure_storage.dart';
import 'package:pump/features/posts/data/dto/create_post_request_dto.dart';
import 'package:pump/features/posts/data/services/post_service.dart';
import 'package:pump/features/posts/domain/entities/post.dart';

import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/utilities/logger_utility.dart';
import '../../domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostService _postService;
  final SecureStorage _secureStorage;

  PostRepositoryImpl(this._postService, {SecureStorage? secureStorage})
    : _secureStorage = secureStorage ?? SecureStorage();

  // TODO: create helper method for getting token and userId (Utils class)
  @override
  Future<Result<Post, AppError>> createPost(
    String title,
    String description,
  ) async {
    try {
      final token = await _secureStorage.getToken();
      if (token == null || token.isEmpty) {
        LoggerUtility.e(
          runtimeType.toString(),
          "Token is missing, will not proceed with API call",
        );
        return Result.failure(
          AppError(
            error: AppStrings.tokenIsMissing,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }

      final userId = await _secureStorage.getCurrentLoggedInUserId();
      if (userId == null || userId.isEmpty) {
        LoggerUtility.e(
          runtimeType.toString(),
          "User id is missing, will not proceed with API call",
        );
        return Result.failure(
          AppError(
            error: AppStrings.userIsNotAuthenticated,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }

      final request = CreatePostRequest(
        title: title,
        description: description,
        userId: userId,
      );
      final result = await _postService.createPost(token, request);

      if (result.isSuccess && result.data != null) {
        LoggerUtility.v(
          runtimeType.toString(),
          'Created post: ${result.data?.toPost()}',
        );
        return Result.success(result.data?.toPost());
      }

      return Result.failure(
        AppError(
          error: result.error?.error ?? AppStrings.unknownError,
          message: result.error?.message ?? AppStrings.failedToFetchUserData,
        ),
      );
    } catch (e, stackTrace) {
      LoggerUtility.e(
        runtimeType.toString(),
        AppStrings.anUnexpectedErrorOccurred,
        e.toString(),
        stackTrace,
      );
      return Result.failure(
        AppError(
          error: AppStrings.anUnexpectedErrorOccurred,
          message: AppStrings.anUnexpectedErrorOccurred,
        ),
      );
    }
  }

  @override
  Future<Result<List<Post>, AppError>> getAllPosts() async {
    try {
      final token = await _secureStorage.getToken();
      if (token == null || token.isEmpty) {
        LoggerUtility.e(
          runtimeType.toString(),
          "Token is missing, will not proceed with API call",
        );
        return Result.failure(
          AppError(
            error: AppStrings.tokenIsMissing,
            message: AppStrings.userIsNotAuthenticated,
          ),
        );
      }

      final result = await _postService.getAllPosts(token);

      if (result.isSuccess && result.data != null) {
        final posts = result.data!.map((e) => e.toPost()).toList();
        LoggerUtility.v(runtimeType.toString(), 'Posts fetched: $posts');
        return Result.success(posts);
      }

      return Result.failure(
        AppError(
          error: result.error?.error ?? AppStrings.unknownError,
          message: result.error?.message ?? AppStrings.failedToFetchUserData,
        ),
      );
    } catch (e, stackTrace) {
      LoggerUtility.e(
        runtimeType.toString(),
        AppStrings.anUnexpectedErrorOccurred,
        e.toString(),
        stackTrace,
      );
      return Result.failure(
        AppError(
          error: AppStrings.anUnexpectedErrorOccurred,
          message: AppStrings.anUnexpectedErrorOccurred,
        ),
      );
    }
  }
}
