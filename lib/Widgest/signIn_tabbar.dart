import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taxioo/Widgest/signUp_tabbar.dart';
import '../Pages/SignIn_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
          currentBackPressTime = now;
          Get.snackbar(
            'Press back again',
            'Please press back again to exit the app.',
            backgroundColor: Colors.amber,
            colorText: Colors.black,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 1),
          );
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Taxioo',
                    style: GoogleFonts.balsamiqSans(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 80,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(150),
                  ),
                  color: Colors.grey[200],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.amber,
                    tabs: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: _tabController.index == 0
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            'LogIn',
                            style: GoogleFonts.balsamiqSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: _tabController.index == 1
                              ? Colors.amber
                              : Colors.grey,
                        ),
                        child: Center(
                          child: Text(
                            'SignUp',
                            style: GoogleFonts.balsamiqSans(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    SigninTabbar(),
                    SignupTabbar(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
