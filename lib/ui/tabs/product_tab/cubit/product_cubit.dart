import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/use_case/cart/add_to_cart.dart';
import 'package:e_commerce/domain/use_case/product/product_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUseCase productUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductCubit({required this.productUseCase, required this.addToCartUseCase})
      : super(ProductInitial());
  List<ProductEntity> products = [];
  int numOfCartItem = 0;

  static ProductCubit get(context) => BlocProvider.of(context);
  void getAllProducts() async {
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await productUseCase.invoke();
    either.fold((l) => emit(ProductErrorState(errors: l)), (response) {
      products = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState(loadingMessage: 'Loading...'));
    var either = await addToCartUseCase.invoke(productId);
    either.fold((l) => emit(AddToCartErrorState(errors: l)), (response) {
      numOfCartItem = response.numOfCartItems!.toInt();
      print('NumOfCartItems: $numOfCartItem');
      emit(AddToCartSuccessState(addCartResponseEntity: response));
    });
  }
}
