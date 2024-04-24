import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getBrand();
}
