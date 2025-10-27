part of 'add_product_cubit.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();

  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {
  const AddProductInitial();
}

final class AddProductLoading extends AddProductState {
  const AddProductLoading();
}

final class AddProductSuccess extends AddProductState {
  const AddProductSuccess();
}

final class AddProductFailure extends AddProductState {
  final String message;

  const AddProductFailure(this.message);

  @override
  List<Object> get props => [message];
}
