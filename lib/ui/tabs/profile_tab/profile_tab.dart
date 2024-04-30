import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var passwordController = TextEditingController();
  var addressController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: Form(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "WELCOME, MARIAM",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const Text(
                      "Mariam@gmail.com",
                      style: TextStyle(color: AppColor.primaryColor),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFieldItem(
                      fieldName: 'Your Full Name',
                      hintText: 'Mariam mahmoud hafez',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter full name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconsFunction: () {},
                    ),
                    TextFieldItem(
                      fieldName: 'Your E-mail',
                      hintText: 'Mariam@gmail.com',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your email address';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return 'invalid email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      suffixIconsFunction: () {},
                    ),
                    TextFieldItem(
                      fieldName: 'Your Password',
                      hintText: '********',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter password';
                        }
                        if (value.trim().length < 6 ||
                            value.trim().length > 30) {
                          return 'password should be >6 & <30';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconsFunction: () {},
                    ),
                    TextFieldItem(
                      fieldName: 'Your Mobile Number',
                      hintText: '01021212121',
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter your mobile no';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconsFunction: () {},
                    ),
                    TextFieldItem(
                      fieldName: 'Your Address',
                      hintText: 'Address',
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'please enter address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      suffixIconsFunction: () {},
                      suffixIcons: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
