import 'package:floor/floor.dart';
import 'package:pump/core/constants/user_entity_constants.dart';

import '../models/user_entity.dart';

@dao
abstract class UserDao {
  @insert
  Future<void> insertUser(UserEntity user);

  @update
  Future<void> updateUser(UserEntity user);

  @Query(
    'SELECT * FROM ${UserEntityConstants.tableName} WHERE ${UserEntityConstants.columnEmail} = :email',
  )
  Future<UserEntity?> getUserByEmail(String email);

  @Query('DELETE FROM ${UserEntityConstants.tableName}')
  Future<void> deleteAllUsers();
}
