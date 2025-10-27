import 'package:decor_nest/core/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';

part 'delete_product_state.dart';

class DeleteProductCubit extends Cubit<DeleteProductState> {
  final AdminRepo adminRepo;

  DeleteProductCubit(this.adminRepo) : super(const DeleteProductInitial());

  Future<void> deleteProduct(Product product) async {
    emit(const DeleteProductLoading());

    final result = await adminRepo.deleteProduct(product: product);
    result.fold(
      (failure) => emit(DeleteProductFailure(failure.message)),
      (_) => emit(const DeleteProductSuccess()),
    );
  }
}
