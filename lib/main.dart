import 'package:dicoding_project/firebase_options.dart';
import 'package:dicoding_project/presentation/auth/login/login_screen.dart';
import 'package:dicoding_project/route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final route = AppRoute();
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: "UI KIT",
        themeMode: ThemeMode.light,
        routerConfig: AppRoute().route,
      ),
    );
  }
}
