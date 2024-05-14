import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entity/home/category_or_brand/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/repo/home/datasource/home_data_source.dart';
import 'package:e_commerce/domain/repo/home/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  HomeRemoteDataSource dataSource;

  HomeRepoImpl({required this.dataSource});

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getCategories() {
    return dataSource.getCategories();
  }

  @override
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getBrand() {
    return dataSource.getBrand();
  }

  @override
  Future<Either<Failures, ProductResponseEntity>> getProduct() {
    return dataSource.getProduct();
  }

  @override
  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId) {
    return dataSource.addToCart(productId);
  }
}
