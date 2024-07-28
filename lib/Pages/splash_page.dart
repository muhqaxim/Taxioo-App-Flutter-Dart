import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:taxioo/OnBoarding/Boarding.dart';

class CustomSplashScreen extends StatefulWidget {
  @override
  _CustomSplashScreenState createState() => _CustomSplashScreenState();
}

class _CustomSplashScreenState extends State<CustomSplashScreen> {
  String _logoPath = 'lib/assets/for_dark_bg.png';

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () {
      // navigate to next page
      Get.to(Boarding());
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Brightness brightness = MediaQuery.of(context).platformBrightness;
      if (brightness == Brightness.dark) {
        setState(() {
          _logoPath = 'lib/assets/for_light_bg.png';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Image.asset(
          _logoPath,
          width: 200.w,
          height: 200.h,
        ),
      ),
    );
  }
}
