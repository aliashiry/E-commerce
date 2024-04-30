import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/tabs/favorite_tab/widget/favorite_tab.dart';
import 'package:e_commerce/ui/tabs/home_tab/widget/home_list_tab.dart';
import 'package:e_commerce/ui/tabs/product_tab/widget/product_list_tab.dart';
import 'package:e_commerce/ui/tabs/profile_tab/profile_tab.dart';
import 'package:flutter/cupertino.dart';

part 'home_screen_view_model_state.dart';

class HomeScreenViewModel extends Cubit<HomeScreenViewModelState> {
  HomeScreenViewModel() : super(HomeScreenViewModelInitial());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeListTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab(),
  ];

  void changeSelectedIndex(int newIndex) {
    emit(HomeScreenViewModelInitial());
    selectedIndex = newIndex;
    emit(HomeChangeSelectedIndex(selectedIndex: selectedIndex));
  }
}
