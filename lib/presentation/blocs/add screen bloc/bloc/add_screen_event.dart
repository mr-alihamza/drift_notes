part of 'add_screen_bloc.dart';

abstract class AddScreenEvent extends Equatable {
  const AddScreenEvent();

  @override
  List<Object> get props => [];
}

class PickImageEvent extends AddScreenEvent {}

class VerifiedOrNotEvent extends AddScreenEvent {
  final bool value;
  const VerifiedOrNotEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class AddUserEvent extends AddScreenEvent {
 final UserEntity userEntity;
 const AddUserEvent({required this.userEntity});

 @override
  List<Object> get props => [userEntity];
}

