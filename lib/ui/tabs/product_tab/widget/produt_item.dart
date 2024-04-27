import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductItem extends StatelessWidget {
  bool isLiked = false;
  ProductEntity productEntity;

  ProductItem({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          //color: AppColor.whiteColor,
          border: Border.all(
            color: AppColor.primaryColor,
            width: 1.w,
          )),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    productEntity.imageCover ?? '',
                    fit: BoxFit.cover,
                    height: 128.h,
                    width: 191.w,
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: AppColor.whiteColor,
                    radius: 16.r,
                    child: IconButton(
                      color: AppColor.primaryColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      iconSize: 22,
                      icon: isLiked == true
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(Icons.favorite_border_rounded),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 3.h,
            // ),
            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: Text(
                productEntity.title ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 7.h),
              child: ReadMoreText(
                productEntity.description ?? '',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor.primaryColor,
                      fontSize: 14.sp,
                    ),
                trimMode: TrimMode.Line,
                trimLines: 1,
                colorClickableText: AppColor.primaryColor,
                trimCollapsedText: 'Show more',
                trimExpandedText: 'Show less',
                moreStyle: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: AppColor.primaryColor, fontSize: 13.sp),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.h),
              child: Text(
                'EGP ${productEntity.price}',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 15.sp,
                      color: AppColor.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    'Review (${productEntity.ratingsAverage})',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 15.sp,
                          color: AppColor.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Image.asset(MyAssets.star),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add_circle,
                    color: AppColor.primaryColor,
                    size: 32.sp,
                  ),
                )
                // const Spacer(
                //   flex: 1,
                // ),
                // InkWell(
                //   onTap: () {},
                //   splashColor: Colors.transparent,
                //   child: Icon(
                //     Icons.add_circle,
                //     color: AppColor.primaryColor,
                //     size: 32.sp,
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
