import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/auth/login/cubit/login_screen_cubit.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/home/home_screen/home_screen_veiw.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:e_commerce/ui/utils/custom_text_field.dart';
import 'package:e_commerce/ui/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenViewModel viewModel =
      LoginScreenViewModel(loginUseCase: injectLoginUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, message: 'Loading...');
        } else if (state is LoginErrorState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
              context: context, message: state.message!, title: 'Error');
        } else if (state is LoginSuccessState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(
              context: context,
              message: state.authResultEntity?.userEntity?.name ?? "",
              title: 'Success');
          Navigator.pushNamed(context, HomeScreenView.routeName);
        }
      },
      child: Scaffold(
        body: Container(
          color: Theme.of(context).primaryColor,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                padding: EdgeInsets.only(left: 16.h, bottom: 10.h, top: 20.h),
                child: Text(
                  'Welcome Back To Route',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.h,
                  bottom: 10.h,
                ),
                child: Text(
                  'Please sign in with your mail',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColor.whiteColor,
                      ),
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
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: ElevatedButton(
                                  onPressed: () {
                                    viewModel.login();
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
                                        'Sign in',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: AppColor.primaryColor,
                                              fontSize: 20.sp,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.routeName);
                                  },
                                  child: Text(
                                    'Don’t have an account? Create Account',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
