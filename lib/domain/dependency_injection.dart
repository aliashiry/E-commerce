// todo: viewModel => object useCase
// todo: useCase => object repo
// todo: repo => object dataSource
// todo: dataSource => object apiManager
import 'package:e_commerce/data/api/api_manager.dart';
import 'package:e_commerce/data/repo/data_source/auth/auth_data_source_impl.dart';
import 'package:e_commerce/data/repo/data_source/home/home_data_source_impl.dart';
import 'package:e_commerce/data/repo/repo/auth/auth_repo_impl.dart';
import 'package:e_commerce/data/repo/repo/home/home_repo_impl.dart';
import 'package:e_commerce/domain/repo/auth/datasource/auth_data_source.dart';
import 'package:e_commerce/domain/repo/auth/repo/auth_repo.dart';
import 'package:e_commerce/domain/repo/home/datasource/home_data_source.dart';
import 'package:e_commerce/domain/repo/home/repo/home_repo.dart';
import 'package:e_commerce/domain/use_case/auth/login/login_use_case.dart';
import 'package:e_commerce/domain/use_case/auth/register/register_use_case.dart';
import 'package:e_commerce/domain/use_case/brand/brand_use_case.dart';
import 'package:e_commerce/domain/use_case/home/home_use_case.dart';

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepo: injectAuthRepo());
}

AuthRepo injectAuthRepo() {
  return AuthRepoImpl(authRemoteDataSource: injectRemoteDataSource());
}

LoginUseCase injectLoginUseCase() {
  return LoginUseCase(authRepo: injectAuthRepo());
}

AuthRemoteDataSource injectRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

HomeUseCase injectHomeUseCase() {
  return HomeUseCase(homeRepo: injectHomeRepo());
}

BrandUseCase injectBrandUseCase() {
  return BrandUseCase(homeRepo: injectHomeRepo());
}

HomeRepo injectHomeRepo() {
  return HomeRepoImpl(dataSource: injectHomeRemoteDataSource());
}

HomeRemoteDataSource injectHomeRemoteDataSource() {
  return HomeRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}
