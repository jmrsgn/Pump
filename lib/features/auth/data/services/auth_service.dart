import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pump/core/constants/api_status.dart';
import 'package:pump/core/constants/app_strings.dart';

import '../../../../core/constants/api_constants.dart';
import '../dto/auth_response_dto.dart';
import '../dto/login_request_dto.dart';
import '../dto/register_request_dto.dart';

class AuthService {
  Future<AuthResponse?> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        headers: ApiConstants.headerType,
        body: jsonEncode(request.toJson()),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == ApiStatus.success ||
          response.statusCode == ApiStatus.created) {
        return AuthResponse.fromJson(json);
      } else {
        return AuthResponse(
          token: null,
          userResponse: null,
          errorMessage:
              json['errorMessage'] ?? AppStrings.anUnexpectedErrorOccurred,
        );
      }
    } catch (e) {
      return AuthResponse(
        token: null,
        userResponse: null,
        errorMessage: '${AppStrings.anUnexpectedErrorOccurred}: $e',
      );
    }
  }

  Future<AuthResponse> register(RegisterRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.registerUrl),
        headers: ApiConstants.headerType,
        body: jsonEncode(request.toJson()),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == ApiStatus.success ||
          response.statusCode == ApiStatus.created) {
        return AuthResponse.fromJson(json);
      } else {
        return AuthResponse(
          token: null,
          userResponse: null,
          errorMessage:
              json['errorMessage'] ?? AppStrings.anUnexpectedErrorOccurred,
        );
      }
    } catch (e) {
      return AuthResponse(
        token: null,
        userResponse: null,
        errorMessage: '${AppStrings.anUnexpectedErrorOccurred}: $e',
      );
    }
  }
}
