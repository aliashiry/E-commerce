import 'package:e_commerce/domain/dependency_injection.dart';
import 'package:e_commerce/ui/home_screen/home_screen/widget/slide_show.dart';
import 'package:e_commerce/ui/tabs/home_tab/cubit/home_tab_view_model_cubit.dart';
import 'package:e_commerce/ui/tabs/home_tab/widget/category.dart';
import 'package:e_commerce/ui/utils/app_colors.dart';
import 'package:e_commerce/ui/widget/custom_searsh.dart';
import 'package:e_commerce/ui/widget/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListTab extends StatelessWidget {
  HomeListTab({super.key});

  HomeTabViewModel viewModel = HomeTabViewModel(
      homeUseCase: injectHomeUseCase(), brandUseCase: injectBrandUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabViewModelState>(
      bloc: viewModel
        ..getCategory()
        ..getBrands(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  // Image.asset(MyAssets.routeName),
                  // SizedBox(height: 18.h),
                  const CustomSearch(),
                  SizedBox(
                    height: 16.h,
                  ),
                  SlideShow(),
                  SizedBox(
                    height: 10.h,
                  ),
                  RowWidget(
                    name: 'Categories',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  state is CategoryLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: AppColor.primaryColor,
                          ),
                        )
                      : CategoryOrBrand(
                          categoryOrBands: viewModel.categories,
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                  RowWidget(name: 'Brands'),
                  state is BrandLoadingState
                      ? const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: AppColor.primaryColor,
                          ),
                        )
                      : CategoryOrBrand(categoryOrBands: viewModel.brandList),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
