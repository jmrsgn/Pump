import '../../../../core/data/models/user_entity.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final int role;
  final String? profileImageUrl;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.role,
    this.profileImageUrl,
  });

  @override
  String toString() {
    return 'User{id: $id, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, role: $role, profileImageUrl: $profileImageUrl}';
  }
}

extension UserMapper on User {
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      role: role,
      profileImageUrl: profileImageUrl,
    );
  }
}

extension UserEntityMapper on UserEntity {
  User toUser() {
    return User(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      role: role,
      profileImageUrl: profileImageUrl,
    );
  }
}
