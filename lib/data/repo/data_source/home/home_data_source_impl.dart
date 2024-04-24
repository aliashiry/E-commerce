import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/repo/home/datasource/home_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  ApiManager apiManager;

  HomeRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getCategories() {
    return apiManager.getCategory();
  }

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getBrand() {
    return apiManager.getBrands();
  }
}
