import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dicoding_project/gen/assets.gen.dart';
import 'package:dicoding_project/presentation/home/home_screen.dart';
import 'package:dicoding_project/presentation/notification/notification_screen.dart';
import 'package:dicoding_project/presentation/payment/check_out_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const name = "/";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _page = [
    const HomeScreen(),
    const CheckoutScreen(),
    const NotifScreen(),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];
  final List<BottomNavyBarItem> _itemBar = [
    BottomNavyBarItem(
      icon: Assets.svg.controlCamera.svg(
        height: 24.r,
        width: 24.r,
        fit: BoxFit.fill,
      ),
      activeColor: Colors.transparent,
      inactiveColor: Colors.transparent,
      title: Text(
        "Home",
        maxLines: 1,
        style: GoogleFonts.workSans(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    BottomNavyBarItem(
      icon: Assets.svg.controlCamera.svg(
        height: 24.r,
        width: 24.r,
        fit: BoxFit.fill,
      ),
      activeColor: Colors.transparent,
      title: Text(
        "Home",
        maxLines: 1,
        style: GoogleFonts.workSans(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    BottomNavyBarItem(
      icon: Assets.svg.controlCamera.svg(
        height: 24.r,
        width: 24.r,
        fit: BoxFit.fill,
      ),
      activeColor: Colors.transparent,
      title: Text(
        "Home",
        maxLines: 1,
        style: GoogleFonts.workSans(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
    BottomNavyBarItem(
      icon: Assets.svg.controlCamera.svg(
        height: 24.r,
        width: 24.r,
        fit: BoxFit.fill,
      ),
      activeColor: Colors.transparent,
      title: Text(
        "Home",
        maxLines: 1,
        style: GoogleFonts.workSans(
          textStyle: TextStyle(
            fontSize: 14.sp,
            color: Colors.black,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          children: _page,
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
          containerHeight: 90.h,
          selectedIndex: _currentIndex,
          iconSize: 42,
          itemCornerRadius: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          backgroundColor: Colors.white,
          onItemSelected: (value) => setState(() {
                _currentIndex = value;
                _pageController.jumpToPage(value);
              }),
          items: _itemBar),
    );
  }
}
