import 'package:bloc/bloc.dart';
import 'package:drift_notes_app/domain/entities/user_entity.dart';
import 'package:drift_notes_app/domain/use%20cases/user%20data%20use%20cases/get_user_data_use_case.dart';
import 'package:equatable/equatable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  final GetUserDataUseCase getUserDataUseCase;
  //final DeleteUserDataUseCase deleteUserDataUseCase;
  HomeScreenBloc({
    required this.getUserDataUseCase,
  //  required this.deleteUserDataUseCase,
  }) : super(HomeScreenInitial()) {
    on<LoadUserDataEvent>((event, emit) async {
      emit(DataLoadingState());

      try {
        List<UserEntity>? userData = await getUserDataUseCase();

        if (state is DataLoadedState) {
          emit((state as DataLoadedState).copyWith(userEntity: userData));
        } else {
          emit(DataLoadedState(userEntity: userData));
        }
      } catch (e) {
        emit(DataLoadErrorState());
      }
    });
  }
}
