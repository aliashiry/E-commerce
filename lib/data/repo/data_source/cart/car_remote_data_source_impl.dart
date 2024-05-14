import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/GetCartResponseEntity.dart';
import 'package:e_commerce/domain/repo/cart/datasource/cart_remote_data_source.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  ApiManager apiManager;

  CartRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, GetCartResponseEntity>> getCart() async {
    var either = await apiManager.getCart();
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> deleteItemInCart(
      String productId) async {
    var either = await apiManager.deleteItemInCart(productId);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }

  @override
  Future<Either<Failures, GetCartResponseEntity>> updateCountInCart(
      int count, String productId) async {
    var either = await apiManager.updateCountInCart(count, productId);
    return either.fold((l) {
      return Left(l);
    }, (response) {
      return Right(response);
    });
  }
}
