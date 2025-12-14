import 'package:drift_notes_app/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.name,
    super.description,
    super.imagePath,
    super.phoneNumber,
    super.id,
    super.isVerified,
  });
}
