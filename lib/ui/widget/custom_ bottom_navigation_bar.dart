import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customBottomNavigationBar({
  required int selectedIndex,
  required Function(int) onTapFunction,
  required BuildContext context,
}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColor.primaryColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      items: [
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 0
                  ? AppColor.primaryColor
                  : AppColor.whiteColor,
              backgroundColor:
                  selectedIndex == 0 ? AppColor.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.selectedHomeIcon),
                color: selectedIndex == 0
                    ? AppColor.primaryColor
                    : AppColor.whiteColor,
              ),
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColor.primaryColor
                  : AppColor.whiteColor,
              backgroundColor:
                  selectedIndex == 1 ? AppColor.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.selectedCategoryIcon),
                color: selectedIndex == 1
                    ? AppColor.primaryColor
                    : AppColor.whiteColor,
              ),
            ),
            label: 'Category'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.whiteColor,
              backgroundColor:
                  selectedIndex == 2 ? AppColor.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.selectedWishListIcon),
                color: selectedIndex == 2
                    ? AppColor.primaryColor
                    : AppColor.whiteColor,
              ),
            ),
            label: 'Fiverte'),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? AppColor.primaryColor
                  : AppColor.whiteColor,
              backgroundColor:
                  selectedIndex == 3 ? AppColor.whiteColor : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                AssetImage(MyAssets.selectedAccountIcon),
                color: selectedIndex == 3
                    ? AppColor.primaryColor
                    : AppColor.whiteColor,
              ),
            ),
            label: 'Profile'),
      ],
    ),
  );
}
