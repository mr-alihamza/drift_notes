part of 'add_screen_bloc.dart';

class AddScreenState extends Equatable {
  final bool isVerified;
  final XFile? imageFile;
  final UserEntity? userEntity;
  const AddScreenState({this.isVerified = false, this.imageFile,this.userEntity});

  AddScreenState copyWith({bool? isVerified, XFile? imageFile,UserEntity? userEntity}) {
    return AddScreenState(
      imageFile: imageFile ?? this.imageFile,
      isVerified: isVerified ?? this.isVerified,
      userEntity: userEntity??this.userEntity,
    );
  }

  @override
  List<Object?> get props => [isVerified, imageFile,userEntity];
}
