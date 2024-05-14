import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/home_screen/cart/cart_screen.dart';
import 'package:e_commerce/ui/product_details/product_details.dart';
import 'package:e_commerce/ui/product_details/produt_item.dart';
import 'package:e_commerce/ui/tabs/product_tab/cubit/product_cubit.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/utils/app_images.dart';
import 'package:e_commerce/ui/widget/custom_searsh.dart';
import 'package:e_commerce/ui/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  static const String routeName = "product_list";

  ProductListTab({super.key});

  ProductCubit viewModel = ProductCubit(
      productUseCase: injectProductUseCase(),
      addToCartUseCase: injectAddToCartUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductCubit>(
      create: (context) => viewModel..getAllProducts(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(children: [
                    const Expanded(
                      child: CustomTextFiled(),
                    ),
                    SizedBox(
                      width: 13.w,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Badge(
                        label: Text(viewModel.numOfCartItem.toString()),
                        child: ImageIcon(
                          const AssetImage(MyAssets.shoppingCart),
                          size: 28.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 7.h,
                    ),
                  ]),
                  SizedBox(
                    height: 16.h,
                  ),
                  state is ProductLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColor.primaryColor,
                          ),
                        )
                      : Expanded(
                          child: GridView.builder(
                            itemCount: viewModel.products.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                              childAspectRatio: 2 / 2.4,
                            ),
                            itemBuilder: (context, index) => InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  ProductDetailsView.routeName,
                                  arguments: viewModel.products[index],
                                );
                              },
                              child: ProductItem(
                                  productEntity: viewModel.products[index]),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
