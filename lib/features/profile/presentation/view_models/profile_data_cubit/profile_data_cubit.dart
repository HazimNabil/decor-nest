import 'package:decor_nest/features/profile/data/repos/profile_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileDataCubit extends Cubit<User?> {
  final ProfileRepo _profileRepo;

  ProfileDataCubit(this._profileRepo) : super(null);

  void emitUser() => emit(_profileRepo.currentUser);
}
