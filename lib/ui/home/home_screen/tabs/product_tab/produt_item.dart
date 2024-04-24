import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: AppColor.whiteColor,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1.w,
          )),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  MyAssets.item1,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  child: IconButton(
                icon: Icon(
                  Icons.favorite_border,
                  color: AppColor.primaryColor,
                  size: 30.w,
                ),
                onPressed: () {},
              ))
            ],
          )
        ],
      ),
    );
  }
}
