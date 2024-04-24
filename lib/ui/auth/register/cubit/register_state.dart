import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String? message;

  RegisterErrorState({required this.message});
}

class RegisterSuccessState extends RegisterState {
  AuthResultEntity? authResultEntity;

  RegisterSuccessState({required this.authResultEntity});
}
