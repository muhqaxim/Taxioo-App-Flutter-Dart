import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
              ),
            ),
            // here goes the Column for animation layouts
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('lib/assets/lottie1.json'),
                Text(
                  'Get Your Taxi',
                  style: GoogleFonts.balsamiqSans(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp),
                ),
                Text(
                  'Simply',
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
