import 'dart:convert';

import 'package:pump/features/auth/data/dto/user_response_dto.dart';

import 'package:http/http.dart' as http;

import '../../constants/api_constants.dart';
import '../../constants/api_status.dart';

class UserService {
  Future<UserResponse?> getProfile(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ApiConstants.loginUrl),
        headers: {...ApiConstants.headerType, 'Authorization': 'Bearer $token'},
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == ApiStatus.success ||
          response.statusCode == ApiStatus.created) {
        return UserResponse.fromJson(json);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<UserResponse?> getUserByEmail(String email, String token) async {
    // TODO:
  }
}
