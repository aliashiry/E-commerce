import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/use_case/product/product_use_case.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUseCase productUseCase;
  List<ProductEntity> products = [];

  ProductCubit({required this.productUseCase}) : super(ProductInitial());

  void getAllProducts() async {
    emit(ProductLoadingState(loadingMessage: 'Loading...'));
    var either = await productUseCase.invoke();
    either.fold((l) => emit(ProductErrorState(errors: l)), (response) {
      products = response.data ?? [];
      emit(ProductSuccessState(productResponseEntity: response));
    });
  }
}
