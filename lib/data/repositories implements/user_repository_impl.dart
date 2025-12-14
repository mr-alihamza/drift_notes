import 'package:drift/drift.dart';
import 'package:drift_notes_app/data/data_sources/database/user_data/user_details_database.dart';
import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDetailsDatabase db;
  UserRepositoryImpl(this.db);

  @override
  Future<void> addUserData(UserEntity user) async {
    await db
        .into(db.userDetailsTable)
        .insert(
          UserDetailsTableCompanion(
            id: Value(user.id!),
            name: Value(user.name!),
            description: Value(user.description!),
            phoneNumber: Value(user.phoneNumber!),
            imagePath: Value(user.imagePath!),
            isVerified: Value(user.isVerified!),
          ),
        );
  }

  @override
  Future<void> deleteUserData(int id) async {
    await (db.delete(
      db.userDetailsTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<List<UserEntity>> getUserData() async {
    final result = await db.select(db.userDetailsTable).get();
    return result
        .map(
          (e) => UserEntity(
            id: e.id,
            name: e.name,
            description: e.description,
            phoneNumber: e.phoneNumber,
            imagePath: e.imagePath,
            isVerified: e.isVerified,
          ),
        )
        .toList();
  }

  @override
  Future<void> updateUserData(UserEntity user) async {
    await (db.update(
      db.userDetailsTable,
    )..where((tbl) => tbl.id.equals(user.id!))).write(
      UserDetailsTableCompanion(
        id: Value(user.id!),
        name: Value(user.name!),
        description: Value(user.description!),
        phoneNumber: Value(user.phoneNumber!),
        imagePath: Value(user.imagePath!),
        isVerified: Value(user.isVerified!),
      ),
    );
  }
}
