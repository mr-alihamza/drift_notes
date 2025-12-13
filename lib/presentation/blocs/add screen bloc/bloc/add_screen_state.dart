part of 'add_screen_bloc.dart';

class AddScreenState extends Equatable {
  final bool isVerified;
  final XFile? imageFile;
  const AddScreenState({this.isVerified = false, this.imageFile});

  AddScreenState copyWith({bool? isVerified, XFile? imageFile}) {
    return AddScreenState(
      imageFile: imageFile ?? this.imageFile,
      isVerified: isVerified ?? this.isVerified,
    );
  }

  @override
  List<Object?> get props => [isVerified, imageFile];
}
