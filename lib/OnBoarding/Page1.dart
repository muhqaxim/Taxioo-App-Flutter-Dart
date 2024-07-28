import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
      ),
      child: Column(
        children: [
          Container(
            height: 420.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                  bottomLeft: Radius.circular(150),
                  //bottomRight: Radius.circular(20),
                )),
            // here goes the Column for animation layouts
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('lib/assets/lottie1.json'),
                Text(
                  'Chose The Rout',
                  style: GoogleFonts.balsamiqSans(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp),
                ),
                Text(
                  'Easily',
                  style: GoogleFonts.balsamiqSans(
                      color: Colors.grey[700], fontSize: 30.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
