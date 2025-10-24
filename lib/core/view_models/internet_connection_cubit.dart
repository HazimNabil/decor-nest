import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionCubit extends Cubit<bool?> {
  final InternetConnection _connection;
  late final StreamSubscription<InternetStatus> _subscription;

  InternetConnectionCubit(this._connection) : super(null) {
    _checkConnection();
  }

  void _checkConnection() {
    _subscription = _connection.onStatusChange.listen((status) async {
      // Fix initial false offline status by verifying actual connectivity
      if (state == null && status == InternetStatus.disconnected) {
        final hasInternet = await _connection.hasInternetAccess;
        emit(hasInternet);
      } else {
        emit(status == InternetStatus.connected);
      }
    });
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
