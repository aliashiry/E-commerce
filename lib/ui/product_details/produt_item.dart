import 'package:e_commerce/domain/entity/home/product/ProductResponseEntity.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductItem extends StatelessWidget {
  bool isWishlisted = false;

  //todo: product
  ProductEntity productEntity;
  ProductItem({required this.productEntity});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 191.w,
      height: 237.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: AppColor.primaryColor,
          width: 1,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.r),
                  child: Image.network(
                    productEntity.imageCover ?? "",
                    fit: BoxFit.cover,
                    width: 191.w,
                    height: 128.h,
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: AppColor.primaryColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: isWishlisted == true
                          ? const Icon(Icons.favorite_rounded)
                          : const Icon(
                              Icons.favorite_border_rounded,
                            ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                productEntity.title ?? '',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontSize: 14.sp,
                      color: AppColor.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
            SizedBox(
              height: 7.h,
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
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Text(
                    "EGP ${productEntity.price}",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.darkPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
              child: Row(
                children: [
                  Text(
                    "Review (${productEntity.ratingsAverage})",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: 14.sp,
                          color: AppColor.darkPrimaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Image.asset(
                    MyAssets.star,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  InkWell(
                    onTap: () {
                      //todo: add to cart
                      // ProductListTabViewModel.get(context).addToCart(
                      //  productEntity.id??"");
                    },
                    splashColor: Colors.transparent,
                    child: Icon(
                      Icons.add_circle,
                      size: 32.sp,
                      color: AppColor.primaryColor,
                    ),
                  )
                ],
              ),
            )
            // GridViewCardItemBody(
            //   productEntity: productEntity,
            // )
          ],
        ),
      ),
    );
  }
}
