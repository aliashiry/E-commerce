import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/AddToCartResponseEntity.dart';
import 'package:e_commerce/domain/repo/home/repo/home_repo.dart';

class AddToCartUseCase {
  HomeRepo homeRepo;

  AddToCartUseCase({required this.homeRepo});

  Future<Either<Failures, AddCartResponseEntity>> invoke(
      String productId) async {
    return await homeRepo.addToCart(productId);
  }
}
