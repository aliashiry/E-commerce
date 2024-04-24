import 'package:bloc/bloc.dart';
import 'package:e_commerce/domain/entity/auth/auth_result_entity.dart';
import 'package:e_commerce/domain/use_case/auth/login/login_use_case.dart';
import 'package:flutter/material.dart';

part 'login_screen_state.dart';

class LoginScreenViewModel extends Cubit<LoginScreenState> {
  LoginScreenViewModel({required this.loginUseCase})
      : super(LoginScreenInitial());
  LoginUseCase loginUseCase;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(text: 'lolo@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  bool isObscure = true;

  void login() async {
    emit(LoginLoadingState());
    var result = await loginUseCase.invoke(
        emailController.text, passwordController.text);
    result.fold((l) => emit(LoginErrorState(message: l.errorMessage)),
        (r) => emit(LoginSuccessState(authResultEntity: r)));
  }
}
