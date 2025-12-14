import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/repositories/user_repository.dart';

class AddUserDataUseCase {
  final UserRepository userRepository;
  const AddUserDataUseCase(this.userRepository);

  Future<void>call(UserEntity user)async => userRepository.addUserData(user);
}
