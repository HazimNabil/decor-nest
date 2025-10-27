import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    if (bloc is Bloc) return;

    final currentState = _formatState(change.currentState);
    final nextState = _formatState(change.nextState);

    log('$currentState → $nextState', name: bloc.runtimeType.toString());
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);

    final event = _formatState(transition.event);
    final currentState = _formatState(transition.currentState);
    final nextState = _formatState(transition.nextState);

    log(
      '$event: $currentState → $nextState',
      name: bloc.runtimeType.toString(),
    );
  }

  String _formatState(dynamic state) {
    if (state is Enum) return '${state.runtimeType}.${state.name}';
    return state.toString().replaceAll('Instance of ', '');
  }
}
