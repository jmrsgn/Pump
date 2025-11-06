import 'dart:convert';
import 'dart:io';

import 'package:pump/core/data/dto/user_response_dto.dart';
import 'package:http/http.dart' as http;

import '../../constants/api/api_constants.dart';
import '../dto/api_error_response.dart';
import '../dto/result.dart';

class UserService {
  Future<Result<UserResponse, ApiErrorResponse>> getCurrentUser(
    String token,
  ) async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.profileUrl),
        headers: {...ApiConstants.headerType, 'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        final user = UserResponse.fromJson(jsonDecode(response.body));
        return Result.success(user);
      } else {
        final error = ApiErrorResponse.fromJson(jsonDecode(response.body));
        return Result.failure(error);
      }
    } catch (e) {
      final error = ApiErrorResponse(
        status: HttpStatus.internalServerError,
        error: e.toString(),
        message: e.toString(),
      );
      return Result.failure(error);
    }
  }
}
