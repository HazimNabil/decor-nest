import 'package:decor_nest/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final ProfileRepo _profileRepo;

  LogoutCubit(this._profileRepo) : super(const LogoutInitial());

  Future<void> logOut() async {
    emit(const LogoutLoading());

    final result = await _profileRepo.logOut();
    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (_) => emit(const LogoutSuccess()),
    );
  }
}
