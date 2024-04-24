import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideShow extends StatelessWidget {
  SlideShow({super.key});

  List<String> images = [
    MyAssets.item1,
    MyAssets.item2,
    MyAssets.item3,
  ];

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      /// Width of the [ImageSlideshow].
      width: double.infinity,

      /// Height of the [ImageSlideshow].
      height: 200,

      /// The page to show when first creating the [ImageSlideshow].
      initialPage: 0,

      /// The color to paint the indicator.
      indicatorColor: AppColor.primaryColor,

      /// The color to paint behind th indicator.
      indicatorBackgroundColor: AppColor.whiteColor,
      indicatorBottomPadding: 18.h,

      /// Auto scroll interval.
      /// Do not auto scroll with null or 0.
      autoPlayInterval: 3000,

      /// Loops back to first slide.
      isLoop: true,

      /// The widgets to display in the [ImageSlideshow].
      /// Add the sample image file into the images folder
      children: images.map((e) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            e,
            fit: BoxFit.fill,
            width: 398.w,
            height: 200.h,
          ),
        );
      }).toList(),
    );
  }
}
