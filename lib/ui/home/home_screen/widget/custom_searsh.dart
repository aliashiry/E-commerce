import 'package:e_commerce/ui/home/home_screen/widget/custom_text_field.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomTextFiled()),
        SizedBox(
          width: 24.w,
        ),
        InkWell(
          onTap: () {},
          child: ImageIcon(
            const AssetImage(MyAssets.shoppingCart),
            size: 28.sp,
            color: AppColor.primaryColor,
          ),
        )
      ],
    );
  }
}
