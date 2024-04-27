import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/use_case/product/product_use_case.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductUseCase productUseCase;
  List<ProductEntity> products = [];

  ProductCubit({required this.productUseCase}) : super(ProductInitial());

  void getProduct() async {
    emit(ProductLoadingState(loadingMessage: 'loading'));
    var result = await productUseCase.invoke();
    result.fold((l) {
      return emit(ProductErrorState(errors: l));
    }, (r) {
      products = r.data ?? [];
      return emit(ProductSuccessState(productResponseEntity: r));
    });
  }
}
