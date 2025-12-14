import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/repositories/user_repository.dart';

class UpdateUserDataUseCase {
  final UserRepository userRepository;
  const UpdateUserDataUseCase (this.userRepository);

  Future<void> call(UserEntity user) async =>
      userRepository.updateUserData(user);
}