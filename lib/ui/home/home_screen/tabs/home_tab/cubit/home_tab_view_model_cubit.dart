import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/use_case/brand/brand_use_case.dart';
import 'package:e_commerce/domain/use_case/home/home_use_case.dart';

part 'home_tab_view_model_state.dart';

class HomeTabViewModel extends Cubit<HomeTabViewModelState> {
  HomeTabViewModel({required this.homeUseCase, required this.brandUseCase})
      : super(HomeTabViewModelInitial());
  HomeUseCase homeUseCase;
  BrandUseCase brandUseCase;
  List<CategoryOrBrandEntity> categories = [];
  List<CategoryOrBrandEntity> brandList = [];

  void getCategory() async {
    emit(CategoryLoadingState(message: 'Loading..'));
    var result = await homeUseCase.invoke();
    result.fold(
      (l) {
        return emit(CategoryErrorState(errors: l));
      },
      (response) {
        categories = response.data ?? [];
        return emit(CategorySuccessState(responseCategoryEntity: response));
      },
    );
  }

  void getBrands() async {
    emit(CategoryLoadingState(message: 'Loading..'));
    var result = await brandUseCase.invoke();
    result.fold(
      (l) {
        return emit(BrandErrorState(errors: l));
      },
      (response) {
        brandList = response.data ?? [];
        return emit(BrandSuccessState(responseCategoryOrBrandEntity: response));
      },
    );
  }
}
