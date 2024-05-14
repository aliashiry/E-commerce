import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/entity/home/category_or_brand/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getCategories();

  Future<Either<Failures, ResponseCategoryOrBrandEntity>> getBrand();

  Future<Either<Failures, ProductResponseEntity>> getProduct();

  Future<Either<Failures, AddCartResponseEntity>> addToCart(String productId);
}
