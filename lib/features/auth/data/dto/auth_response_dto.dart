import 'package:pump/core/data/dto/user_response_dto.dart';

class AuthResponse {
  String? token;
  UserResponse? userResponse;

  AuthResponse({this.token, this.userResponse});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final userData = json['userResponse'];

    return AuthResponse(
      token: json['token'],
      userResponse: userData == null ? null : UserResponse.fromJson(userData),
    );
  }
}
