import 'package:bloc/bloc.dart';
import 'package:e_commerce/ui/home/home_screen/tabs/account_tab.dart';
import 'package:e_commerce/ui/home/home_screen/tabs/categories_tab.dart';
import 'package:e_commerce/ui/home/home_screen/tabs/favorite_tab.dart';
import 'package:e_commerce/ui/home/home_screen/tabs/home_tab/home_list_tab.dart';
import 'package:flutter/cupertino.dart';

part 'home_screen_view_model_state.dart';

class HomeScreenViewModel extends Cubit<HomeScreenViewModelState> {
  HomeScreenViewModel() : super(HomeScreenViewModelInitial());
  int selectedIndex = 0;
  List<Widget> tabs = [
    HomeListTab(),
    const CategoriesTab(),
    const FavoriteTab(),
    const AccountTab(),
  ];

  void changeSelectedIndex(int newindex) {
    emit(HomeScreenViewModelInitial());
    selectedIndex = newindex;
    emit(HomeChangeSelectedIndex(selectedIndex: selectedIndex));
  }
}
