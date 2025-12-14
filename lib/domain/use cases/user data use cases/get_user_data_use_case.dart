import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/repositories/user_repository.dart';

class GetUserDataUseCase {
  final UserRepository userRepository;
  const GetUserDataUseCase(this.userRepository);

  Future<List<UserEntity>> call() async =>
      userRepository.getUserData();
}
