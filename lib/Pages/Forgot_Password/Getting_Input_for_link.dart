import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class GettingInputForLink extends StatefulWidget {
  const GettingInputForLink({super.key});

  @override
  State<GettingInputForLink> createState() => _GettingInputForLinkState();
}

class _GettingInputForLinkState extends State<GettingInputForLink> {
  TextEditingController emailController = TextEditingController();

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
                  'Password',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                Text(
                  'Recovery ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
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
                // here comes the animation for forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset('lib/assets/lottie5.json',
                        height: 150, width: 200),
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'Please enter your email to send \nthe recovery link',
                      style: GoogleFonts.balsamiqSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(
                  onTapOutside: (value) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                        color: Colors.amber, // Set focus border color to amber
                      ),
                    ),
                    prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),

                SizedBox(height: 10.h),

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
                      // Get.to(CodeVerification());
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
