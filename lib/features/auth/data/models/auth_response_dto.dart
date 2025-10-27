import 'package:pump/features/auth/data/models/user_response_dto.dart';

class AuthResponse {
  String? token;
  UserResponse? userResponse;
  String? authMessage;

  AuthResponse({this.token, this.userResponse, this.authMessage});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      userResponse: UserResponse.fromJson(json['userResponse']),
      authMessage: json['authMessage'],
    );
  }
}
