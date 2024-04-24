import 'package:e_commerce/ui/home/home_screen/tabs/product_tab/produt_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  static const String routName = "product_list";

  const ProductListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: GridView.builder(
        itemCount: 10,
        //scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) => const ProductItem(),
      ),
    );
  }
}
