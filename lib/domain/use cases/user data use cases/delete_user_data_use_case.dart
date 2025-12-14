import 'package:drift_notes_app/domain/repositories/user_repository.dart';

class DeleteUserDataUseCase {
  final UserRepository userRepository;
  const DeleteUserDataUseCase(this.userRepository);

  Future<void> call(int id) async => userRepository.deleteUserData(id);
}
