import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxioo/BottomNavBar/HomePage.dart';
import 'package:taxioo/Pages/Forgot_Password/forgot_passwor.dart';

class SigninTabbar extends StatefulWidget {
  const SigninTabbar({super.key});

  @override
  State<SigninTabbar> createState() => _SigninTabbarState();
}

class _SigninTabbarState extends State<SigninTabbar> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> _signin() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          backgroundColor: Colors.amber,
          colorText: Colors.black,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.amber,
        colorText: Colors.black,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 2),
      );
    }
  }

  bool _isObscure = true;
  bool _ischecked = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 90),
        child: Column(
          children: [
            TextFormField(
              onTapOutside: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber, // Set focus border color to amber
                  ),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 30.h),
            TextFormField(
              onTapOutside: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: _isObscure,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber, // Set focus border color to amber
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                prefixIcon: Icon(Icons.lock, color: Colors.grey[700]),
                suffixIcon: IconButton(
                  icon: Icon(
                      _isObscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(ForgotPasswordPage());
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.balsamiqSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Remember me',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                Checkbox(
                  value: _ischecked,
                  onChanged: (value) {
                    setState(() {
                      _ischecked = value!;
                    });
                  },
                  activeColor: Colors.amber,
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Or Sign With',
              style: GoogleFonts.balsamiqSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 50.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Image.asset(
                        'lib/assets/apple.png',
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Image.asset(
                        'lib/assets/google.png',
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: Colors.grey,
                    ),
                    child: Center(
                      child: Image.asset(
                        'lib/assets/facebook.png',
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.amber,
                ),
                onPressed: _signin,
                child: Text(
                  'Login',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
