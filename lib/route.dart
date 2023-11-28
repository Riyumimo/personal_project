import 'package:dicoding_project/presentation/auth/login/login_screen.dart';
import 'package:dicoding_project/presentation/auth/register/register_screen.dart';
import 'package:dicoding_project/presentation/main_page/main_page.dart';
import 'package:dicoding_project/presentation/payment/check_out_screen.dart';
import 'package:go_router/go_router.dart';

class AppRoute {
  // static Route onGenerateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case MainPage.name:
  //       return MaterialPageRoute(
  //         builder: (context) =>  MainPage(),
  //       );
  //     case LoginScreen.name:
  //       return MaterialPageRoute(
  //         builder: (context) => const LoginScreen(),
  //       );
  //     case RegisterScreen.name:
  //       return MaterialPageRoute(
  //         builder: (context) => const RegisterScreen(),
  //       );
  //     case CheckoutScreen.name:
  //       return MaterialPageRoute(
  //         builder: (context) => const CheckoutScreen(),
  //       );
  //     default:
  //       return MaterialPageRoute(
  //         builder: (context) => Container(),
  //       );
  //   }
  // }

  final route = GoRouter(routes: [
    GoRoute(path: MainPage.name, builder: (context, state) => const MainPage()),
    GoRoute(
        path: LoginScreen.name,
        builder: (context, state) => const LoginScreen()),
    GoRoute(
        path: RegisterScreen.name,
        builder: (context, state) => const RegisterScreen()),
    GoRoute(
        path: CheckoutScreen.name,
        builder: (context, state) => const CheckoutScreen()),
  ]);
}
