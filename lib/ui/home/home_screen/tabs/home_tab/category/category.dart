import 'package:e_commerce/domain/entity/home/ResponseCategoryEntity.dart';
import 'package:e_commerce/ui/home/home_screen/widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrand extends StatelessWidget {
  CategoryOrBrand({super.key, required this.categoryOrBands});

  List<CategoryOrBrandEntity> categoryOrBands;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        itemCount: categoryOrBands.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return CategoryOrBrandItem(
            categoryOrBrandEntity: categoryOrBands[index],
          );
        },
      ),
    );
  }
}
