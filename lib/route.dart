import 'package:dicoding_project/presentation/auth/login/login_screen.dart';
import 'package:dicoding_project/presentation/auth/register/register_screen.dart';
import 'package:dicoding_project/presentation/main_page/main_page.dart';
import 'package:dicoding_project/presentation/payment/cart_screen.dart';
import 'package:dicoding_project/presentation/payment/check_out_screen.dart';
import 'package:dicoding_project/presentation/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return SplashPage.route();
      case LoginScreen.name:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case RegisterScreen.name:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case MainPage.name:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case CartScreen.name:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case CheckOutScreen.name:
        return MaterialPageRoute(builder: (_) => const CheckOutScreen());
    }
    return null;
  }
}
