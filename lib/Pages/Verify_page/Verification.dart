import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxioo/Pages/Forgot_Password/Creating_new_psw.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key});

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    super.dispose();
  }

  // Helper method to handle focus navigation between OTP input fields
  void _onTextChanged(
      String value, FocusNode currentNode, FocusNode previousNode) {
    if (value.isNotEmpty) {
      currentNode.requestFocus();
    } else {
      previousNode.requestFocus();
    }
  }

  void _showOTPSnackbar() {
    Get.snackbar(
      'OTP Code has been send',
      'Please check your phone.',
      backgroundColor: Colors.amber,
      colorText: Colors.black,
      snackPosition: SnackPosition.TOP,
      duration: Duration(seconds: 1),
    );
  }

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verification ',
              style: GoogleFonts.balsamiqSans(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30.sp,
              ),
            ),
            Text(
              'Code ',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //textAlign: TextAlign.center,
                  'Verification Code Sent To ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(150),
                    //bottomRight: Radius.circular(20),
                  ),
                  color: Colors.grey[200],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      //textAlign: TextAlign.center,
                      '+92-312-651-4491 ',
                      style: GoogleFonts.balsamiqSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextFormField(
                      controller: _controller1,
                      focusNode: _focusNode1,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '-',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:
                                Colors.amber, // Set focus border color to amber
                          ),
                        ),
                        contentPadding: EdgeInsets.all(25),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        _onTextChanged(value, _focusNode2, _focusNode1);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextFormField(
                      controller: _controller2,
                      focusNode: _focusNode2,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '-',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:
                                Colors.amber, // Set focus border color to amber
                          ),
                        ),
                        contentPadding: EdgeInsets.all(25),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        _onTextChanged(value, _focusNode3, _focusNode1);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextFormField(
                      controller: _controller3,
                      focusNode: _focusNode3,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '-',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:
                                Colors.amber, // Set focus border color to amber
                          ),
                        ),
                        contentPadding: EdgeInsets.all(25),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        _onTextChanged(value, _focusNode4, _focusNode2);
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    child: TextFormField(
                      controller: _controller4,
                      focusNode: _focusNode4,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText: '-',
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color:
                                Colors.amber, // Set focus border color to amber
                          ),
                        ),
                        contentPadding: EdgeInsets.all(25),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        _onTextChanged(value, _focusNode4, _focusNode3);
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  //textAlign: TextAlign.center,
                  'Resend Code in : 3.00 ',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.grey,
                ),
                onPressed: () {
                  //
                  _showOTPSnackbar();
                },
                child: Text(
                  'Resend',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 60),
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  //
                  Get.to(CreatingNewPsw());
                },
                child: Text(
                  'Verify',
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
