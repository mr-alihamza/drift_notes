part of 'home_screen_bloc.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadUserDataEvent extends HomeScreenEvent {}

class DeleteUserDataEvent extends HomeScreenEvent {
  final int id;
  const DeleteUserDataEvent({required this.id});
  @override
  List<Object> get props => [id];
}
