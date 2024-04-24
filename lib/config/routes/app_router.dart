import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/home/home_screen/home_screen_veiw.dart';
import 'package:e_commerce/ui/home/home_screen/tabs/product_tab/product_list_tab.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutesName {
  static const String splash = '/';
}

class AppRoute {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case HomeScreenView.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreenView());
      case ProductListTab.routName:
        return MaterialPageRoute(builder: (context) => ProductListTab());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
