import 'package:bloc/bloc.dart';
import 'package:drift_notes_app/core/utils.dart';
import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/use%20cases/user%20data%20use%20cases/add_user_data_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'add_screen_event.dart';
part 'add_screen_state.dart';

class AddScreenBloc extends Bloc<AddScreenEvent, AddScreenState> {
  final AddUserDataUseCase addUserDataUseCase;
  
  AddScreenBloc({required this.addUserDataUseCase}) : super(AddScreenState()) {
    on<VerifiedOrNotEvent>((event, emit) {
      emit(state.copyWith(isVerified: event.value));
    });

    on<PickImageEvent>((event, emit) async {
      XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      emit(state.copyWith(imageFile: pickedImage ?? state.imageFile));
    });

    on<AddUserEvent>((event, emit) async {
      await addUserDataUseCase(event.userEntity);
      emit(state.copyWith(userEntity: event.userEntity));
    });
  }
}
