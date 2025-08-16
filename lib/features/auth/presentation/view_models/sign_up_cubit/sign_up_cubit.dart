import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/features/auth/data/repos/auth_repo.dart';
import 'package:decor_nest/features/auth/data/models/sign_up_input_data.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo _authRepo;

  SignUpCubit(this._authRepo) : super(const SignUpInitial());

  Future<void> signUp(SignUpInputData signUpInputData) async {
    emit(const SignUpLoading());

    final result = await _authRepo.signUp(signUpInputData);
    result.fold(
      (failure) => emit(SignUpFailure(failure.message)),
      (_) => emit(const SignUpSuccess()),
    );
  }
}
