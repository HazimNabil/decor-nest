import 'dart:io' show File;

import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/models/product_input_data.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Cubit;

part 'edit_product_state.dart';

class EditProductCubit extends Cubit<EditProductState> {
  final AdminRepo _adminRepo;

  EditProductCubit(this._adminRepo) : super(const EditProductInitial());

  Future<void> editProduct({
    required ProductInputData fields,
    required Product product,
    File? image,
  }) async {
    emit(const EditProductLoading());

    final result = await _adminRepo.updateProduct(
      fields: fields.toJson(),
      product: product,
      image: image,
    );
    result.fold(
      (failure) => emit(EditProductFailure(failure.message)),
      (_) => emit(const EditProductSuccess()),
    );
  }
}
