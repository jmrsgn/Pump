import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pump/core/constants/api_status.dart';
import 'package:pump/core/constants/app_strings.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/auth_response_dto.dart';
import '../models/login_request_dto.dart';

class AuthService {
  Future<AuthResponse?> login(LoginRequest request) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.loginUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(request.toJson()),
      );

      final json = jsonDecode(response.body);

      print("JSON BODY");
      print(json);

      if (response.statusCode == ApiStatus.SUCCESS) {
        return AuthResponse.fromJson(json);
      } else {
        return AuthResponse(
          token: null,
          userResponse: null,
          authMessage: json['authMessage'] ?? AppStrings.anUnexpectedErrorOccurred,
        );
      }
    } catch (e) {
      return AuthResponse(
        token: null,
        userResponse: null,
        authMessage: '${AppStrings.anUnexpectedErrorOccurred}: $e',
      );
    }
  }
}
