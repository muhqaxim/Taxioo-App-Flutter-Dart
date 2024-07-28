import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taxioo/OnBoarding/Page1.dart';
import 'package:taxioo/OnBoarding/Page2.dart';
import 'package:taxioo/OnBoarding/Page3.dart';
import 'package:taxioo/OnBoarding/Page4.dart';
import 'package:taxioo/Pages/SignIn_page.dart';

import '../Widgest/signIn_tabbar.dart';

class Boarding extends StatefulWidget {
  const Boarding({Key? key}) : super(key: key);

  @override
  State<Boarding> createState() => _BoardingState();
}

class _BoardingState extends State<Boarding> {
  PageController _controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 60.h,
          ),
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 3);
                });
              },
              children: const [
                Page1(),
                Page2(),
                Page3(),
                Page4(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: _controller,
                count: 4,
                effect: ScrollingDotsEffect(
                  activeDotColor: Colors.black87,
                  activeStrokeWidth: 1.9,
                  activeDotScale: 1.4,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 10,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: TextButton(
              onPressed: () {
                _controller.jumpToPage(3); // Jump to the last page
              },
              child: Text(
                'Skip',
                style: GoogleFonts.balsamiqSans(
                    color: Colors.grey[700], fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                foregroundColor: Colors.white,
                backgroundColor: Colors.amber,
              ),
              onPressed: () {
                if (onLastPage) {
                  Get.to(SignInPage());
                } else {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: Text(
                onLastPage ? 'Finish' : 'Next',
                style: GoogleFonts.balsamiqSans(
                    color: Colors.white, fontSize: 25.sp),
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
