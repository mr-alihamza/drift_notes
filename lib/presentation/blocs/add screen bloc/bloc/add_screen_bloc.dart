import 'package:bloc/bloc.dart';
import 'package:drift_notes_app/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'add_screen_event.dart';
part 'add_screen_state.dart';

class AddScreenBloc extends Bloc<AddScreenEvent, AddScreenState> {
  AddScreenBloc() : super(AddScreenState()) {
    on<VerifiedOrNotEvent>((event, emit) {
      emit(state.copyWith(isVerified: event.value));
    });

    on<PickImageEvent>((event, emit) async {
      XFile? pickedImage = await imagePicker.pickImage(
        source: ImageSource.camera,
      );
      emit(state.copyWith(imageFile: pickedImage ?? state.imageFile));
    });
  }
}
