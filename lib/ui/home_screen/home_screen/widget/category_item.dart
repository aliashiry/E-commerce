import 'package:e_commerce/domain/entity/home/category_or_brand/ResponseCategoryEntity.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandItem({super.key, required this.categoryOrBrandEntity});

  CategoryOrBrandEntity categoryOrBrandEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 9,
          child: CircleAvatar(
            radius: 50.r,
            backgroundImage: NetworkImage(categoryOrBrandEntity.image ?? ""),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            categoryOrBrandEntity.name ?? "",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 15.sp,
                  color: AppColor.darkPrimaryColor,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
      ],
    );
  }
}
