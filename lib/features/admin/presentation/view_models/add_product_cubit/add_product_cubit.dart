import 'dart:io' show File;

import 'package:decor_nest/core/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final AdminRepo adminRepo;

  AddProductCubit(this.adminRepo) : super(const AddProductInitial());

  Future<void> addProduct(Product product, File image) async {
    emit(const AddProductLoading());

    final result = await adminRepo.addProduct(product: product, image: image);
    result.fold(
      (failure) => emit(AddProductFailure(failure.message)),
      (_) => emit(const AddProductSuccess()),
    );
  }
}
