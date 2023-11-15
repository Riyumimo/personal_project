import 'package:dicoding_project/presentation/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "UI KIT",
        themeMode: ThemeMode.light,
        home: MainPage(),
      ),
    );
  }
}
