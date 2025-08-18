import 'package:decor_nest/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show User;
import 'package:decor_nest/features/auth/data/models/login_input_data.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(const LoginInitial());

  Future<void> logIn(LoginInputData loginInputData) async {
    emit(const LoginLoading());

    final result = await _authRepo.logIn(loginInputData);
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (user) => emit(LoginSuccess(user)),
    );
  }
}
