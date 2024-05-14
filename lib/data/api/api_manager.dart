import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/data/api/api_constants.dart';
import 'package:e_commerce/data/model/auth/login/LoginRequest.dart';
import 'package:e_commerce/data/model/auth/login/LoginResponseDto.dart';
import 'package:e_commerce/data/model/auth/register/RegisterReqest.dart';
import 'package:e_commerce/data/model/auth/register/RegisterResopnseDto.dart';
import 'package:e_commerce/data/model/cart/AddToCartResponseDto.dart';
import 'package:e_commerce/data/model/cart/GetCartResponseDto.dart';
import 'package:e_commerce/data/model/home/ResponseCategoryOrBrandDto.dart';
import 'package:e_commerce/data/model/home/product/ProductResopnseDto.dart';
import 'package:e_commerce/domain/entity/failures.dart';
import 'package:e_commerce/domain/entity/home/cart/AddToCartResponseEntity.dart';
import 'package:e_commerce/ui/utils/shared_preferences.dart';
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

  Future<Either<Failures, ProductResponseDto>> getProducts() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.getProducts);
      var response = await http.get(url);
      var productResponse =
          ProductResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(productResponse);
      } else {
        return Left(ServerError(errorMessage: productResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, AddCartResponseEntity>> addToCart(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.addToCart);
      var token = SharedPreference.getData(Key: 'Token');
      var response = await http.post(url, body: {
        "productId": productId,
      }, headers: {
        'token': token.toString()
      });
      var addToCartResponse =
          AddCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> getCart() async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url = Uri.https(Constants.baseUrl, EndPoint.addToCart);
      // get token
      var token = SharedPreference.getData(Key: 'Token');
      var response = await http.get(url, headers: {'token': token!.toString()});
      var getCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> deleteItemInCart(
      String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(Constants.baseUrl, '${EndPoint.addToCart}/$productId');
      // get token
      var token = SharedPreference.getData(Key: 'Token');
      var response =
          await http.delete(url, headers: {'token': token!.toString()});
      var deleteItemInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(deleteItemInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: deleteItemInCartResponse.message));
      } else {
        return Left(
            ServerError(errorMessage: deleteItemInCartResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }

  Future<Either<Failures, GetCartResponseDto>> updateCountInCart(
      int count, String productId) async {
    var connectivityResult =
        await Connectivity().checkConnectivity(); // User defined class
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Uri url =
          Uri.https(Constants.baseUrl, '${EndPoint.addToCart}/$productId');
      // get token
      var token = SharedPreference.getData(Key: 'Token');
      var response = await http.put(url,
          body: {'count': '$count'}, headers: {'token': token!.toString()});
      var updateCountInCartResponse =
          GetCartResponseDto.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode < 300) {
        // success
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message));
      } else {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message));
      }
    } else {
      // no internet connection
      return Left(
          NetworkError(errorMessage: 'Please check Internet Connection'));
    }
  }
}
