part of 'profile_edit_cubit.dart';

sealed class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

final class ProfileEditInitial extends ProfileEditState {
  const ProfileEditInitial();
}

final class ProfileEditLoading extends ProfileEditState {
  const ProfileEditLoading();
}

final class ProfileEditSuccess extends ProfileEditState {
  const ProfileEditSuccess();
}

final class ProfileEditFailure extends ProfileEditState {
  final String message;

  const ProfileEditFailure(this.message);

  @override
  List<Object> get props => [message];
}
