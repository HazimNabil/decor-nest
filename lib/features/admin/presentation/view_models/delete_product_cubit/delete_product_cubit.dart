import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  DeleteProductCubit() : super(const DeleteProductInitial());
}
