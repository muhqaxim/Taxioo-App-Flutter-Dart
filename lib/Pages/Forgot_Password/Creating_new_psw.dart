import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatingNewPsw extends StatefulWidget {
  const CreatingNewPsw({super.key});

  @override
  State<CreatingNewPsw> createState() => _CreatingNewPswState();
}

class _CreatingNewPswState extends State<CreatingNewPsw> {
  bool _isObscure = true;
  bool _ischecked = false;
  TextEditingController passwordcontroller = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create New  ',
                style: GoogleFonts.balsamiqSans(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                ),
              ),
              Text(
                'Password ',
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
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create a strong and secure password\n to protect your account',
                    style: GoogleFonts.balsamiqSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
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
                controller: passwordcontroller,
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
              SizedBox(height: 10),
              PasswordStrengthIndicator(
                password: passwordcontroller.text,
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _ischecked,
                    onChanged: (value) {
                      setState(() {
                        _ischecked = value!;
                      });
                    },
                    activeColor: Colors.amber,
                  ),
                  Text(
                    'Password must contain at least 6 characters',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: _ischecked,
                    onChanged: (value) {
                      setState(() {
                        _ischecked = value!;
                      });
                    },
                    activeColor: Colors.amber,
                  ),
                  Text(
                    'Password must contain at least 2 numbers',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),   
              ElevatedButton(
                onPressed: () {
                 
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  minimumSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Send Code',
                  style: GoogleFonts.balsamiqSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordStrengthIndicator extends StatelessWidget {
  final String password;

  const PasswordStrengthIndicator({required this.password});

  @override
  Widget build(BuildContext context) {
    // Implement password strength indicator logic here
    // For demonstration, let's assume a basic logic based on the length of the password
    double strength = password.length / 6; // Example logic

    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 10,
            color: strength >= 0.5 ? Colors.green : Colors.red,
          ),
          SizedBox(width: 10),
          Text(
            strength >= 0.5 ? 'Strong' : 'Weak',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: strength >= 0.5 ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
