import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;
  TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize screen util for responsive design
    ScreenUtil.init(context, designSize: Size(375, 812), minTextAdapt: true);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Placeholder for the map
          Container(
            color: Colors.grey[200],
            child: Center(
              child: Text(
                'Map will be here',
                style: TextStyle(fontSize: 20.sp, color: Colors.grey),
              ),
            ),
          ),
          // Top bar with location button and search bar
          Positioned(
            top: isExpanded ? 10 : 50,
            left: 20,
            right: 20,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details != null && details.primaryDelta != null) {
                  if (details.primaryDelta! < -20) {
                    setState(() {
                      isExpanded = true;
                    });
                  } else if (details.primaryDelta! > 20) {
                    setState(() {
                      isExpanded = false;
                    });
                  }
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: isExpanded ? 100.h : 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: Icon(Icons.my_location),
                        onPressed: () {
                          // Add location button action here
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = !isExpanded;
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Text(
                          'Location',
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
            ),
          ),
          // Bottom section with destination input
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: isExpanded ? 150.h : 70.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: detailsController,
                            keyboardType: TextInputType.multiline,
                            maxLines: null,
                            minLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Where are you going?',
                              border: InputBorder.none,
                            ),
                            onSubmitted: (value) {
                              // Handle search functionality here
                              print('Destination: $value');
                            },
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                          ),
                        ),
                      ],
                    ),
                    if (isExpanded)
                      SizedBox(
                        height: 70.h,
                      ),
                    if (isExpanded)
                      Text(
                        'Additional content when expanded',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
