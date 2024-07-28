import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxioo/Pages/Verify_page/Verification.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.grey[700],
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Go Back',
            style: GoogleFonts.balsamiqSans(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify Your Phone ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                Text(
                  'Number ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                Container(
                  width: 100,
                  child: Divider(
                    thickness: 6,
                    color: Colors.amber,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Please chose one of the below option\nwhich one would you like to recive the code ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Sending Code on phone number
                  },
                  child: _buildOption(
                    context,
                    icon: Icons.phone_android,
                    title: "via SMS",
                    detail: "000********000",
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Sending a code on email
                  },
                  child: _buildOption(
                    context,
                    icon: Icons.email,
                    title: "via Email",
                    detail: "example@domain.com",
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 60),
                      backgroundColor: Colors.amber,
                    ),
                    onPressed: () {
                      // here it will move to verify page
                      Get.to(CodeVerification());
                    },
                    child: Text(
                      'Send Code',
                      style: GoogleFonts.balsamiqSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

//  for now I am making seperate components for above two containers
Widget _buildOption(BuildContext context,
    {required IconData icon, required String title, required String detail}) {
  return Container(
    height: 80.h,
    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.4),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      children: [
        Icon(icon, color: Colors.amber[300], size: 50),
        SizedBox(width: 20.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,
                  style: GoogleFonts.balsamiqSans(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 4),
              Text(detail,
                  style: GoogleFonts.balsamiqSans(
                      fontSize: 14, color: Colors.grey[600])),
            ],
          ),
        ),
      ],
    ),
  );
}
