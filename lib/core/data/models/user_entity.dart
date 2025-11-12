import 'package:floor/floor.dart';

import '../../constants/user_entity_constants.dart';

@Entity(tableName: UserEntityConstants.tableName)
class UserEntity {
  final String id;
  @primaryKey
  final String email;
  final String firstName;
  final String lastName;
  final String phone;
  final int role;
  final String? profileImageUrl;

  UserEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.role,
    this.profileImageUrl,
  });
}
