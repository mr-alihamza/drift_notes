part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class DataLoadingState extends HomeScreenState {}

class DataLoadedState extends HomeScreenState {
  final List<UserEntity>? userEntity;
  const DataLoadedState({this.userEntity});

  DataLoadedState copyWith({List<UserEntity>? userEntity}) {
    return DataLoadedState(userEntity: userEntity ?? userEntity);
  }

  // @override
  // List<Object?> get props => [userEntity];
}

class DataLoadErrorState extends HomeScreenState {}
