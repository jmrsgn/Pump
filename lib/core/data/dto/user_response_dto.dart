import 'package:pump/core/domain/entities/user.dart';

class UserResponse {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? email;
  final String? phone;
  final int? role;
  final String? profileImageUrl;

  UserResponse({
    this.firstName,
    this.lastName,
    this.username,
    this.email,
    this.phone,
    this.role,
    this.profileImageUrl,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      role: json['role'],
      profileImageUrl: json['profileImageUrl'],
    );
  }

  User toUser() {
    return User(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      email: email ?? '',
      phone: phone ?? '',
      role: role ?? 0,
      profileImageUrl: profileImageUrl,
    );
  }
}
