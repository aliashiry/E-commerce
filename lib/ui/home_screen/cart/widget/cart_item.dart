import 'package:e_commerce/domain/entity/home/cart/GetCartResponseEntity.dart';
import 'package:e_commerce/ui/home_screen/cart/cubit/cart_screen_view_model.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class CartItem extends StatelessWidget {
  GetProductCartEntity cartEntity;

  CartItem({required this.cartEntity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 1.w, color: AppColor.lightGreyColor)),
        width: 398.w,
        height: 170.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 150.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(cartEntity.product?.imageCover ?? ""),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16.h),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ReadMoreText(
                              "${cartEntity.product?.title ?? ""}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                              trimMode: TrimMode.Line,
                              trimLines: 1,
                              colorClickableText: AppColor.primaryColor,
                              trimCollapsedText: ' Show more',
                              trimExpandedText: ' Show less',
                              moreStyle: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      color: AppColor.primaryColor,
                                      fontSize: 15.sp),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              //todo: delete item in cart
                              CartScreenViewModel.get(context).deleteItemInCart(
                                  cartEntity.product?.id ?? '');
                            },
                            child: Icon(
                              Icons.delete_outline,
                              color: AppColor.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 13.h, bottom: 13.h),
                    child: Row(
                      children: [
                        Text('Count:${cartEntity.count} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: AppColor.blueGreyColor)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 14.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('EGP ${cartEntity.price}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold)),
                          Container(
                            height: 50.h,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(
                                100.r,
                              ),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    //todo: decrement count
                                    int counter = cartEntity.count!.toInt();
                                    counter--;
                                    CartScreenViewModel.get(context)
                                        .updateCountInCart(counter,
                                            cartEntity.product?.id ?? "");
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline_rounded,
                                    color: AppColor.whiteColor,
                                    size: 28.sp,
                                  ),
                                ),
                                Text(
                                  '${cartEntity.count}',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.whiteColor),
                                ),
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {
                                    //todo: increment count
                                    int counter = cartEntity.count!.toInt();
                                    counter++;
                                    CartScreenViewModel.get(context)
                                        .updateCountInCart(counter,
                                            cartEntity.product?.id ?? "");
                                  },
                                  icon: Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: AppColor.whiteColor,
                                    size: 28.sp,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ]),
          )),
        ]),
      ),
    );
  }
}
