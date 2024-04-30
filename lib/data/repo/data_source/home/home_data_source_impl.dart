import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/category_or_brand/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/repo/home/datasource/home_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>>
      getCategories() async {
    var either = await apiManager.getCategory();
    return either.fold((l) => Left(l), (r) => right(r));
  }

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getBrand() async {
    var either = await apiManager.getBrands();
    return either.fold((l) => Left(l), (r) => right(r));
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProduct() async {
    var either = await apiManager.getProducts();
    return either.fold((l) => Left(l), (r) => right(r));
  }
}
