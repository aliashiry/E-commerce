part of 'home_tab_view_model_cubit.dart';

sealed class HomeTabViewModelState {}

final class HomeTabViewModelInitial extends HomeTabViewModelState {}

class CategoryLoadingState extends HomeTabViewModelState {
  String message;

  CategoryLoadingState({required this.message});
}

class CategoryErrorState extends HomeTabViewModelState {
  Failures errors;

  CategoryErrorState({required this.errors});
}

class CategorySuccessState extends HomeTabViewModelState {
  ResponseCategoryOrBrandEntity responseCategoryEntity;

  CategorySuccessState({required this.responseCategoryEntity});
}

class BrandLoadingState extends HomeTabViewModelState {
  String message;

  BrandLoadingState({required this.message});
}

class BrandErrorState extends HomeTabViewModelState {
  Failures errors;

  BrandErrorState({required this.errors});
}

class BrandSuccessState extends HomeTabViewModelState {
  ResponseCategoryOrBrandEntity responseCategoryOrBrandEntity;

  BrandSuccessState({required this.responseCategoryOrBrandEntity});
}
