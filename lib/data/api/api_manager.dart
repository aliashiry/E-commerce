import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/model/auth/login/LoginRequest.dart';
import 'package:e_commerce/data/model/auth/login/LoginResponseDto.dart';
import 'package:e_commerce/data/model/auth/register/RegisterReqest.dart';
import 'package:e_commerce/data/model/auth/register/RegisterResopnseDto.dart';
import 'package:e_commerce/data/model/home/ResponseCategoryOrBrandDto.dart';
import 'package:e_commerce/data/model/home/product/ProductResopnseDto.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/ui/utils/constants.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  ApiManager._();

  static ApiManager? _instance;

  static ApiManager getInstance() {
    _instance ??= ApiManager._();
    return _instance!;
  }

  Future<Either<Failures, RegisterResponseDto>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var register = RegisterRequest(
        name: name,
        email: email,
        password: password,
        rePassword: rePassword,
        phone: phone,
      );
      Uri url = Uri.https(Constants.baseUrl, EndPoint.signup);
      var response = await http.post(url, body: register.toJson());
      var registerResponse =
          RegisterResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(registerResponse);
      } else {
        return Left(ServerError(
            errorMessage: registerResponse.error != null
                ? registerResponse.error!.msg!
                : registerResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, LoginResponseDto>> login(
    String email,
    String password,
  ) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var login = LoginRequest(
        email: email,
        password: password,
      );
      Uri url = Uri.https(Constants.baseUrl, EndPoint.login);
      var response = await http.post(url, body: login.toJson());
      var loginResponse = LoginResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(loginResponse);
      } else {
        return Left(ServerError(errorMessage: loginResponse.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, ResponseCategoryOrBrandDto>> getCategory() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.getCategories);
      var response = await http.get(url);
      var getCategory =
          ResponseCategoryOrBrandDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCategory);
      } else {
        return Left(ServerError(errorMessage: getCategory.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, ResponseCategoryOrBrandDto>> getBrands() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.getBrands);
      var response = await http.get(url);
      var getBrands =
          ResponseCategoryOrBrandDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getBrands);
      } else {
        return Left(ServerError(errorMessage: getBrands.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }

  Future<Either<Failures, ProductResponseDto>> getProduct() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.getProducts);
      var response = await http.get(url);
      var getProduct = ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getProduct);
      } else {
        return Left(ServerError(errorMessage: getProduct.message));
      }
    } else {
      return Left(
          NetworkError(errorMessage: 'Please check internet connection'));
    }
  }
}
