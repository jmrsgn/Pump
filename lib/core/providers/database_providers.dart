import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../app_database.dart';
import '../dao/user_dao.dart';

final appDatabaseProvider = FutureProvider<AppDatabase>((ref) async {
  final database = await $FloorAppDatabase
      .databaseBuilder('pump.db')
      .build();
  return database;
});

final userDaoProvider = Provider<UserDao>((ref) {
  final db = ref
      .watch(appDatabaseProvider)
      .maybeWhen(
        data: (db) => db,
        orElse: () => throw Exception("Database not ready"),
      );
  return db.userDao;
});
