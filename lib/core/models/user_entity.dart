import 'package:floor/floor.dart';

@entity
class UserEntity {
  @primaryKey
  final String email; // using email as primary key
  final String firstName;
  final String lastName;
  final String phone;
  final int role;
  final String? profileImageUrl;

  UserEntity({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.role,
    this.profileImageUrl,
  });
}
