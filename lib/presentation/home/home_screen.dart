import 'package:dicoding_project/gen/assets.gen.dart';
import 'package:dicoding_project/gen/colors.gen.dart';
import 'package:dicoding_project/presentation/bloc/Authentication/authentacion_bloc.dart';
import 'package:dicoding_project/presentation/category/category_screen.dart';
import 'package:dicoding_project/presentation/home/component/catergory.dart';
import 'package:dicoding_project/presentation/product/product_detail.dart';
import 'package:dicoding_project/presentation/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["House", "Hotels", "Apartment"];
  PageController? _pageController;

  int _currentPage = 0;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24.w, top: 18.h, bottom: 18.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 60.r,
                        height: 60.r,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45.r),
                            color: ColorName.text100),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      "John Doe",
                      style: GoogleFonts.workSans(
                        textStyle: TextStyle(
                          fontSize: 16.sp,
                          color: ColorName.bg100,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        context
                            .read<AuthentacionBloc>()
                            .add(AuthenticationLogoutRequested());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: Assets.svg.notification.svg(
                          height: 36.r,
                          width: 36.r,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      readOnly: true,
                      //false
                      autofocus: false,
                      // style: ,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: const Icon(Icons.search, color: Colors.black),
                        ),
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 20.w, maxWidth: 35.w),
                        hintText: "Search...",
                        // hintStyle: textFieldPlaceholderTextStyle(context),
                        isDense: true,
                        filled: true,
                        fillColor: ColorName.bg200,
                        focusedBorder: AppStyles.focusedTransparentBorder,
                        disabledBorder: AppStyles.focusedTransparentBorder,
                        enabledBorder: AppStyles.focusedTransparentBorder,
                        errorBorder: AppStyles.focusedTransparentBorder,
                        focusedErrorBorder: AppStyles.focusedTransparentBorder,
                        errorStyle: errorTextStyle(context),
                      ),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      onSaved: (val) {},
                      onEditingComplete: () {},
                      onChanged: (val) {},
                      // validator: (val) {},
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (value) {
                          setState(() {
                            _currentPage = value;
                          });
                        },
                        children: List.generate(
                            3,
                            (index) => const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  child: BannerPromotion(),
                                )),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _dotIndicator()
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 24.w, right: 24.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Categories",
                          style: GoogleFonts.workSans(
                            textStyle: TextStyle(
                              fontSize: 20.sp,
                              color: Colors.black,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const CategoryScreen()));
                          },
                          child: Text(
                            "See all",
                            style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                color: ColorName.primary100,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: List.generate(
                    3,
                    (index) => SizedBox(
                          height: 140.h,
                          child: const CategoryContainer(
                              categoryName: "categoryName",
                              categoryColor: ColorName.primary100,
                              icon: Icons.build),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dotIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(3, (int index) {
        return Container(
          width: 10,
          height: 10,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:
                _currentPage == index ? ColorName.primary100 : ColorName.bg300,
          ),
        );
      }),
    );
  }
}

class BannerPromotion extends StatelessWidget {
  const BannerPromotion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductDetail()));
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.25,
              color: ColorName.bg300,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 15.w, bottom: 12.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tai Po Beach",
                            maxLines: 1,
                            style: GoogleFonts.workSans(
                              textStyle: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(Icons.edit_location),
                              SizedBox(width: 4.w),

                              /// Todo : This should be tested for overflow
                              Text(
                                "Kam Ling, Hong Kong",
                                maxLines: 1,
                                style: GoogleFonts.workSans(
                                  textStyle: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
