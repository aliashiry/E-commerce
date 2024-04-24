import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';
import 'package:e_commerce/domain/repo/home/repo/home_repo.dart';

class BrandUseCase {
  HomeRepo homeRepo;

  BrandUseCase({required this.homeRepo});

  Future<Either<Failures, ResponseCategoryOrBrandEntity>> invoke() async {
    return await homeRepo.getBrand();
  }
}
