import 'package:dicoding_project/firebase_options.dart';
import 'package:dicoding_project/presentation/auth_screen/login/login_screen.dart';
import 'package:dicoding_project/presentation/bloc/Authentication/authentacion_bloc.dart';
import 'package:dicoding_project/presentation/bloc/cubit/theme_cubit.dart';
import 'package:dicoding_project/presentation/main_page/main_page.dart';
import 'package:dicoding_project/presentation/payment/cart_screen.dart';
import 'package:dicoding_project/presentation/payment/check_out_screen.dart';
import 'package:dicoding_project/presentation/splash_screen.dart';
import 'package:dicoding_project/route.dart';
import 'package:dicoding_project/services/auth/login_services/login_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LoginServices _loginServices;
  @override
  void initState() {
    _loginServices = LoginServices();
    super.initState();
  }

  @override
  void dispose() {
    _loginServices.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _loginServices,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthentacionBloc(loginServices: _loginServices),
          ),
          BlocProvider(
            create: (context) => ThemeCubit()..getThemeFromPref(),
          ),
        ],
        child: AppView(
          loginServices: _loginServices,
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final LoginServices loginServices;
  const AppView({super.key, required this.loginServices});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    // final AuthentacionBloc authentacionBloc =
    //     AuthentacionBloc(loginServices: widget.loginServices);
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, state) {
          print(state.brightness);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // title: "UI KIT",
            // themeMode: ThemeMode.dark,
            theme: state,
            // navigatorKey: _navigatorKey,
            // builder: (context, child) {
            //   return BlocListener<AuthentacionBloc, AuthentacionState>(
            //     listener: (context, state) {
            //       switch (state.status) {
            //         case AuthenticationStatus.authenticated:
            //           _navigator.pushAndRemoveUntil<void>(MaterialPageRoute(
            //             builder: (context) {
            //               return const MainPage();
            //             },
            //           ), (route) => false);
            //         case AuthenticationStatus.unauthenticated:
            //           _navigator.pushAndRemoveUntil<void>(MaterialPageRoute(
            //             builder: (context) {
            //               return const LoginScreen();
            //             },
            //           ), (route) => false);
            //         case AuthenticationStatus.unauthenticated:
            //           _navigator.pushAndRemoveUntil<void>(MaterialPageRoute(
            //             builder: (context) {
            //               return const LoginScreen();
            //             },
            //           ), (route) => false);
            //         case AuthenticationStatus.unknown:
            //           break;
            //       }
            //     },
            //     child: child,
            //   );
            // },
            // onGenerateRoute: AppRoutes.onGenerateRoute,
            home: const CheckOutScreen(),
          );
        },
      ),
    );
  }
}
