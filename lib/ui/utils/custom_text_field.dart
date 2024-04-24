import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatelessWidget {
  String fieldName;
  String hintText;
  Widget? suffixIcons;
  bool isObscure;
  var keyboardType;
  void Function()? suffixIconsFunction;
  String? Function(String?)? validator;
  TextEditingController controller;

  TextFieldItem({
    super.key,
    required this.fieldName,
    required this.hintText,
    required this.controller,
    this.suffixIcons,
    this.validator,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.suffixIconsFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          fieldName,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 18.sp, color: AppColor.whiteColor),
          textAlign: TextAlign.left,
        ),
        Padding(
            padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: AppColor.whiteColor,
                filled: true,
                suffixIcon: suffixIcons,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.blueGreyColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColor.blueGreyColor),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColor.redColor,
                  ),
                  borderRadius: BorderRadius.circular(15.r),
                ),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColor.greyColor,
                    ),
              ),
              style: const TextStyle(color: AppColor.blackColor),
              validator: validator,
              obscureText: isObscure,
              keyboardType: keyboardType,
              controller: controller,
            ))
      ],
    );
  }
}
