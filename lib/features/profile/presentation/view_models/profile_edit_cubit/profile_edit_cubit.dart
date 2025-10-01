import 'package:decor_nest/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_edit_state.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  final ProfileRepo _profileRepo;

  ProfileEditCubit(this._profileRepo) : super(const ProfileEditInitial());

  Future<void> changeUsername(String username) async {
    emit(const ProfileEditLoading());

    final result = await _profileRepo.changeUsername(username);
    result.fold(
      (failure) => emit(ProfileEditFailure(failure.message)),
      (_) => emit(const ProfileEditSuccess()),
    );
  }

  Future<void> changeEmail(String email) async {
    emit(const ProfileEditLoading());

    final result = await _profileRepo.changeEmail(email);
    result.fold(
      (failure) => emit(ProfileEditFailure(failure.message)),
      (_) => emit(const ProfileEditSuccess()),
    );
  }

  Future<void> changePassword(String password) async {
    emit(const ProfileEditLoading());

    final result = await _profileRepo.changePassword(password);
    result.fold(
      (failure) => emit(ProfileEditFailure(failure.message)),
      (_) => emit(const ProfileEditSuccess()),
    );
  }
}
