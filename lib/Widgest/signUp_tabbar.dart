import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../BottomNavBar/HomePage.dart';

class SignupTabbar extends StatefulWidget {
  const SignupTabbar({Key? key}) : super(key: key);

  @override
  State<SignupTabbar> createState() => _SignupTabbarState();
}

class _SignupTabbarState extends State<SignupTabbar> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  bool _isObscure = true;
  bool _ischecked = false;

  Future<void> _signup() async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      // Add additional user info to Firestore or other services if needed

      Get.to(HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            TextFormField(
              onTapOutside: (value) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              controller: phoneNumberController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                prefixIcon: Icon(Icons.person, color: Colors.grey[700]),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(
              height: 15.h,
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
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    color: Colors.amber,
                  ),
                ),
                prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 15.h),
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
                    color: Colors.amber,
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
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password Strength', // Customize this text as needed
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                // Placeholder for password strength indicator
                // You can replace this with your desired password strength indicator widget
                Container(
                  width: 100,
                  height: 20,
                  color: Colors.amber, // Customize the color as needed
                ),
              ],
            ),
            SizedBox(height: 15.h),
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
            SizedBox(height: 20.h),
            Text(
              'Or Sign Up With',
              style: GoogleFonts.balsamiqSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 15.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      // SignUpWithApple()
                    },
                    child: Container(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      // SignUpWithGoogle()
                    },
                    child: Container(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      // SignUp
                    },
                    child: Container(
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
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.amber,
                ),
                onPressed: _signup,
                child: Text(
                  'Sign Up',
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
    );
  }
}
