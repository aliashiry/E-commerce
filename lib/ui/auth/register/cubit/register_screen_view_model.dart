import 'package:e_commerce/domain/use_case/auth/register/register_use_case.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewModel extends Cubit<RegisterState> {
  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  // todo: hold data and handle logic
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController(text: 'Ali');
  var emailController = TextEditingController(text: 'ali@gmail.com');
  var passwordController = TextEditingController(text: '123456');
  var confirmPasswordController = TextEditingController(text: '123456');
  var phoneController = TextEditingController(text: '01010752755');
  bool isObscure = true;
  RegisterUseCase registerUseCase;

  void register() async {
    emit(RegisterLoadingState());
    var either = await registerUseCase.invoke(
        nameController.text,
        emailController.text,
        passwordController.text,
        confirmPasswordController.text,
        phoneController.text);
    either.fold((l) {
      emit(RegisterErrorState(message: l.errorMessage));
    }, (r) {
      emit(RegisterSuccessState(authResultEntity: r));
    });
  }
}
