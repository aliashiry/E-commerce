import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/repo/auth/datasource/auth_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;

  AuthRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, AuthResultEntity>> register(String name, String email,
      String password, String rePassword, String phone) async {
    // TODO: implement register
    var result =
        await apiManager.register(name, email, password, rePassword, phone);
    return result.fold((l) => Left(l), (r) => Right(r.toAuthResultEntity()));
  }

  @override
  Future<Either<Failures, AuthResultEntity>> login(
      String email, String password) async {
    var result = await apiManager.login(email, password);
    return result.fold((l) => Left(l), (r) => Right(r.toAuthResultEntity()));
  }
}
