import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'add_screen_event.dart';
part 'add_screen_state.dart';

class AddScreenBloc extends Bloc<AddScreenEvent, AddScreenState> {
  AddScreenBloc() : super(AddScreenInitial()) {
    on<AddScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
