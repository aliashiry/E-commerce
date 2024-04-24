import 'package:dartz/dartz.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/auth/datasource/auth_data_source.dart';
import 'package:e_commerce/domain/repo/auth/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) {
    return authRemoteDataSource.register(
        name, email, password, rePassword, phone);
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) {
    return authRemoteDataSource.login(email, password);
  }
}
