import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/repo/cart/repo/cart_repo.dart';

class GetCartUseCase {
  CartRepository cartRepository;

  GetCartUseCase({required this.cartRepository});

  Future<Either<Failures, GetCartResponseEntity>> invoke() {
    return cartRepository.getCart();
  }
}
