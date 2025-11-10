import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pump/core/constants/api/api_constants.dart';
import 'package:pump/core/constants/app/app_strings.dart';
import 'package:pump/core/data/dto/api_error_response.dart';
import 'package:pump/core/data/dto/result.dart';

import '../dto/create_post_request_dto.dart';
import '../dto/post_response_dto.dart';

class PostService {
  // Get all posts
  Future<Result<List<PostResponse>, ApiErrorResponse>> getAllPosts(
    String token,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.postUrl),
        headers: {...ApiConstants.headerType, 'Authorization': 'Bearer $token'},
      );

      final jsonBody = jsonDecode(response.body);

      if (response.statusCode == HttpStatus.ok) {
        // Assume the backend returns a list of posts
        List<PostResponse> posts = (jsonBody['data'] as List)
            .map((e) => PostResponse.fromJson(e))
            .toList();

        return Result.success(posts);
      } else {
        final error = ApiErrorResponse.fromJson(jsonBody['error']);
        return Result.failure(error);
      }
    } catch (e) {
      return Result.failure(
        ApiErrorResponse(
          status: HttpStatus.internalServerError,
          error: AppStrings.internalServerError,
          message: e.toString(),
        ),
      );
    }
  }

  /// Create a new post, after sending it to server, return the created post
  ///
  /// @param request: CreatePostRequest
  /// returns: Result<PostResponse, ApiErrorResponse>
  Future<Result<PostResponse, ApiErrorResponse>> createPost(
    CreatePostRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.postUrl),
        headers: ApiConstants.headerType,
        body: jsonEncode(request.toJson()),
      );

      final jsonBody = jsonDecode(response.body);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return Result.success(PostResponse.fromJson(jsonBody['data']));
      } else {
        final error = ApiErrorResponse.fromJson(jsonBody['error']);
        return Result.failure(error);
      }
    } catch (e) {
      return Result.failure(
        ApiErrorResponse(
          status: HttpStatus.internalServerError,
          error: AppStrings.internalServerError,
          message: e.toString(),
        ),
      );
    }
  }
}
