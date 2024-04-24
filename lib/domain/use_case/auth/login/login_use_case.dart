import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/auth/repo/auth_repo.dart';

class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase({required this.authRepo});

  Future<Either<Failures, AuthResultEntity>> invoke(
      String email, String password) {
    return authRepo.login(email, password);
  }
}
