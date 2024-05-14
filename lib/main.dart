import 'package:e_commerce/config/theme/theme.dart';
import 'package:e_commerce/ui/auth/login/login_screen.dart';
import 'package:e_commerce/ui/auth/register/register_screen.dart';
import 'package:e_commerce/ui/home_screen/cart/cart_screen.dart';
import 'package:e_commerce/ui/home_screen/home_screen/widget/home_screen_veiw.dart';
import 'package:e_commerce/ui/product_details/product_details.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:e_commerce/ui/utils/bloc_observer.dart';
import 'package:e_commerce/ui/utils/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.init();
  var user = SharedPreference.getData(Key: 'Token');
  String route;
  if (user != null) {
    route = HomeScreenView.routeName;
  } else {
    route = SplashScreen.routeName;
  }

  Bloc.observer = MyBlocObserver();
  runApp(MyApp(
    route: route,
  ));
}

class MyApp extends StatelessWidget {
  String route;

  MyApp({super.key, required this.route});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => const SplashScreen(),
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              HomeScreenView.routeName: (context) => const HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
            },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
