part of 'add_screen_bloc.dart';

sealed class AddScreenState extends Equatable {
  final bool isVerified;
  final XFile? imageFile;
  const AddScreenState({this.isVerified = false, this.imageFile});

  @override
  List<Object> get props => [];
}

final class AddScreenInitial extends AddScreenState {}
