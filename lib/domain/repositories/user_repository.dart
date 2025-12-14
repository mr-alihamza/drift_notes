import 'package:drift_notes_app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUserData();
  Future<void> addUserData(UserEntity user);
  Future<void> updateUserData(UserEntity user);
  Future<void> deleteUserData(int id);
}
