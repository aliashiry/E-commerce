import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/GetCartResponseEntity.dart';

abstract class CartStates {}

class CartInitialState extends CartStates {}

class GetCartLoadingState extends CartStates {
  String? loadingMessage;

  GetCartLoadingState({required this.loadingMessage});
}

class GetCartErrorState extends CartStates {
  Failures? errors;

  GetCartErrorState({required this.errors});
}

class GetCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  GetCartSuccessState({required this.responseEntity});
}

class DeleteItemInCartLoadingState extends CartStates {
  String? loadingMessage;

  DeleteItemInCartLoadingState({required this.loadingMessage});
}

class DeleteItemInCartErrorState extends CartStates {
  Failures? errors;

  DeleteItemInCartErrorState({required this.errors});
}

class DeleteItemInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  DeleteItemInCartSuccessState({required this.responseEntity});
}

class UpdateCountInCartLoadingState extends CartStates {
  String? loadingMessage;

  UpdateCountInCartLoadingState({required this.loadingMessage});
}

class UpdateCountInCartErrorState extends CartStates {
  Failures? errors;

  UpdateCountInCartErrorState({required this.errors});
}

class UpdateCountInCartSuccessState extends CartStates {
  GetCartResponseEntity responseEntity;

  UpdateCountInCartSuccessState({required this.responseEntity});
}
