import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/domain/repo/home/repo/home_repo.dart';

class ProductUseCase {
  HomeRepo homeTabRepository;

  ProductUseCase({required this.homeTabRepository});

  Future<Either<Failures, ProductResponseEntity>> invoke() {
    return homeTabRepository.getProduct();
  }
}