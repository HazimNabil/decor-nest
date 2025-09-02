part of 'edit_product_cubit.dart';

sealed class EditProductState extends Equatable {
  const EditProductState();

  @override
  List<Object> get props => [];
}

final class EditProductInitial extends EditProductState {
  const EditProductInitial();
}

final class EditProductLoading extends EditProductState {
  const EditProductLoading();
}

final class EditProductSuccess extends EditProductState {
  const EditProductSuccess();
}

final class EditProductFailure extends EditProductState {
  final String message;

  const EditProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
