import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_screen_view_model.dart';
import 'package:e_commerce/ui/auth/register/cubit/register_state.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:e_commerce/ui/utils/custom_text_field.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel viewModel =
      RegisterViewModel(registerUseCase: injectRegisterUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is RegisterErrorState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
              context: context, message: state.message!, title: 'Error');
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
              context: context,
              message: state.authResultEntity?.userEntity?.name ?? "",
              title: 'Success');
          Navigator.pushNamed(context, LoginScreen.routeName);
        }
      },
      child: Scaffold(
          body: Container(
        color: Theme.of(context).primaryColor,
        height: double.infinity,
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 91.h,
                bottom: 46.h,
                left: 97.w,
                right: 97.w,
              ),
              child: Image.asset(
                MyAssets.appLogo,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1.h),
                    child: Form(
                        key: viewModel.formKey,
                        child: Column(
                          children: [
                            TextFieldItem(
                              fieldName: 'Full Name',
                              hintText: 'enter your name',
                              controller: viewModel.nameController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Email Address',
                              hintText: 'enter your email address',
                              controller: viewModel.emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email address';
                                }
                                final bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return 'invalid email';
                                }
                                return null;
                              },
                            ),
                            TextFieldItem(
                              fieldName: 'Password',
                              hintText: 'enter your password',
                              controller: viewModel.passwordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return 'Password must be between 6 and 30 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isObscure: viewModel.isObscure,
                              suffixIcons: InkWell(
                                  child: viewModel.isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  }),
                            ),
                            TextFieldItem(
                              fieldName: 'ConFirm Password',
                              hintText: 'enter your confirm password',
                              controller: viewModel.confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your confirm password';
                                }
                                if (value.trim().length < 6 ||
                                    value.trim().length > 30) {
                                  return 'Password must be between 6 and 30 characters';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.visiblePassword,
                              isObscure: viewModel.isObscure,
                              suffixIcons: InkWell(
                                  child: viewModel.isObscure
                                      ? const Icon(Icons.visibility_off)
                                      : const Icon(Icons.visibility),
                                  onTap: () {
                                    if (viewModel.isObscure) {
                                      viewModel.isObscure = false;
                                    } else {
                                      viewModel.isObscure = true;
                                    }
                                    setState(() {});
                                  }),
                            ),
                            TextFieldItem(
                              fieldName: 'phone number',
                              hintText: 'enter your  phone number',
                              controller: viewModel.phoneController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your  phone number';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h),
                              child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.register();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColor.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r)),
                                    ),
                                  ),
                                  child: SizedBox(
                                    height: 64.h,
                                    width: 398.w,
                                    child: Center(
                                      child: Text(
                                        'Sign up',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: AppColor.primaryColor,
                                              fontSize: 20.sp,
                                            ),
                                      ),
                                    ),
                                  )),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ],
        )),
      )),
    );
  }
}
