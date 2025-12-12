part of 'add_screen_bloc.dart';

abstract class AddScreenEvent extends Equatable {
  const AddScreenEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends AddScreenEvent{}
class VerifiedOrNotEvent extends AddScreenEvent{}