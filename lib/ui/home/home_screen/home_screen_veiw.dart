import 'package:e_commerce/ui/home/home_screen/cubit/home_screen_view_model_cubit.dart';
import 'package:e_commerce/ui/widget/custom_%20bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenView extends StatefulWidget {
  static const String routeName = 'home_screen_view';

  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: customBottomNavigationBar(
            selectedIndex: viewModel.selectedIndex,
            context: context,
            onTapFunction: (index) {
              viewModel.changeSelectedIndex(index);
            },
          ),
          body: viewModel.tabs[viewModel.selectedIndex],
        );
      },
    );
  }
}
