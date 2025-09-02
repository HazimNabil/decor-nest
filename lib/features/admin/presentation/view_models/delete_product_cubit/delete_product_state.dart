part of 'delete_product_cubit.dart';

sealed class DeleteProductState extends Equatable {
  const DeleteProductState();

  @override
  List<Object> get props => [];
}

final class DeleteProductInitial extends DeleteProductState {
  const DeleteProductInitial();
}

final class DeleteProductLoading extends DeleteProductState {
  const DeleteProductLoading();
}

final class DeleteProductSuccess extends DeleteProductState {
  const DeleteProductSuccess();
}

final class DeleteProductFailure extends DeleteProductState {
  final String message;

  const DeleteProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
