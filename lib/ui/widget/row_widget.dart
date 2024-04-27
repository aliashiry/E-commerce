import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowWidget extends StatelessWidget {
  RowWidget({super.key, required this.name});

  String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.darkPrimaryColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
          ),
        ),
        TextButton(
            onPressed: () {},
            child: Text('View All',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor.darkPrimaryColor,
                    ))),
      ],
    );
  }
}
