import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pump/core/data/dto/api_error_response.dart';
import 'package:pump/core/utilities/logger_utility.dart';

import '../../../../core/constants/api/api_constants.dart';
import '../../../../core/constants/app/app_strings.dart';
import '../../../../core/data/dto/result.dart';
import '../dto/auth_response_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/register_request_dto.dart';

class AuthService {
  Future<Result<AuthResponse, ApiErrorResponse>> login(
    LoginRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        headers: ApiConstants.headerType,
        body: jsonEncode(request.toJson()),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return Result.success(AuthResponse.fromJson(json['data']));
      } else {
        return Result.failure(ApiErrorResponse.fromJson(json['error']));
      }
    } catch (e, stackTrace) {
      LoggerUtility.e(e.toString(), stackTrace);
      final apiErrorResponse = ApiErrorResponse(
        status: HttpStatus.internalServerError,
        error: AppStrings.anUnexpectedErrorOccurred,
        message: AppStrings.anUnexpectedErrorOccurred,
      );
      return Result.failure(apiErrorResponse);
    }
  }

  Future<Result<AuthResponse, ApiErrorResponse>> register(
    RegisterRequest request,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.registerUrl),
        headers: ApiConstants.headerType,
        body: jsonEncode(request.toJson()),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        return Result.success(AuthResponse.fromJson(json['data']));
      } else {
        return Result.failure(ApiErrorResponse.fromJson(json['error']));
      }
    } catch (e, stackTrace) {
      LoggerUtility.e(e.toString(), stackTrace);
      final apiErrorResponse = ApiErrorResponse(
        status: HttpStatus.internalServerError,
        error: AppStrings.anUnexpectedErrorOccurred,
        message: AppStrings.anUnexpectedErrorOccurred,
      );
      return Result.failure(apiErrorResponse);
    }
  }
}
