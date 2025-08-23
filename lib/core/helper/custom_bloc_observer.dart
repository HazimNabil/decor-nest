import 'dart:developer' show log;

import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) {
      final blocType = bloc.runtimeType;
      final currentStateType = change.currentState.runtimeType;
      final nextStateType = change.nextState.runtimeType;

      log('[$blocType] $currentStateType → $nextStateType');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    final blocType = bloc.runtimeType;
    final eventType = transition.event.runtimeType;
    final currentStateType = transition.currentState.runtimeType;
    final nextStateType = transition.nextState.runtimeType;

    log('[$blocType] $eventType\n$currentStateType → $nextStateType');
  }
}
