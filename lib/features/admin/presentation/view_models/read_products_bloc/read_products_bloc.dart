import 'package:decor_nest/core/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'read_products_event.dart';
part 'read_products_state.dart';

class ReadProductsBloc extends Bloc<ReadProductsEvent, ReadProductsState> {
  ReadProductsBloc() : super(const ReadProductsState()) {
    on<ProductsFetched>((event, emit) {
      // TODO: implement event handler
    });
  }
}
