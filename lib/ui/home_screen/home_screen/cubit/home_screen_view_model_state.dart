part of 'home_screen_view_model_cubit.dart';

@immutable
sealed class HomeScreenViewModelState {}

final class HomeScreenViewModelInitial extends HomeScreenViewModelState {}

class HomeChangeSelectedIndex extends HomeScreenViewModelState {
  int selectedIndex = 0;

  HomeChangeSelectedIndex({required this.selectedIndex});
}
