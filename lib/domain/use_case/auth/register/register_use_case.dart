import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/auth/repo/auth_repo.dart';

class RegisterUseCase {
  AuthRepo authRepo;

  RegisterUseCase({required this.authRepo});

  Future<Either<Failures, AuthResultEntity>> invoke(String name, String email,
      String password, String rePassword, String phone) {
    return authRepo.register(name, email, password, rePassword, phone);
  }
}
