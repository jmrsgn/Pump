import 'package:pump/core/data/dto/user_response_dto.dart';

class AuthResponse {
  String? token;
  UserResponse? userResponse;
  String? errorMessage;

  AuthResponse({this.token, this.userResponse, this.errorMessage});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    final userData = json['userResponse'];

    return AuthResponse(
      token: json['token'],
      userResponse: userData == null ? null : UserResponse.fromJson(userData),
      errorMessage: json['errorMessage'],
    );
  }
}
