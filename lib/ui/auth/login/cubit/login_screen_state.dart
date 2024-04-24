part of 'login_screen_cubit.dart';

sealed class LoginScreenState {}

final class LoginScreenInitial extends LoginScreenState {}

class LoginLoadingState extends LoginScreenState {}

class LoginErrorState extends LoginScreenState {
  String? message;

  LoginErrorState({required this.message});
}

class LoginSuccessState extends LoginScreenState {
  AuthResultEntity? authResultEntity;

  LoginSuccessState({required this.authResultEntity});
}
