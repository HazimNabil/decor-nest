import 'package:decor_nest/core/models/product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_products_event.dart';
part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  FetchProductsBloc() : super(const FetchProductsState()) {
    on<FetchProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
