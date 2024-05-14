part of 'product_cubit.dart';

sealed class ProductState {}

final class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {
  String loadingMessage;

  ProductLoadingState({required this.loadingMessage});
}

class ProductErrorState extends ProductState {
  Failures errors;

  ProductErrorState({required this.errors});
}

class ProductSuccessState extends ProductState {
  ProductResponseEntity productResponseEntity;

  ProductSuccessState({required this.productResponseEntity});
}

class AddToCartLoadingState extends ProductState {
  String? loadingMessage;

  AddToCartLoadingState({required this.loadingMessage});
}

class AddToCartErrorState extends ProductState {
  Failures? errors;

  AddToCartErrorState({required this.errors});
}

class AddToCartSuccessState extends ProductState {
  AddCartResponseEntity addCartResponseEntity;

  AddToCartSuccessState({required this.addCartResponseEntity});
}
