import 'package:flutter/material.dart';
import 'package:ufs_update/screens/login_screen/login_Screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Al NAJMAH  Attendance',
                textScaleFactor: 1.5,
                style: textStyle(
                  size: 20.sp,
                  weight: FontWeight.w800,
                ),
              ),

              Image.asset(
                'assets/images/ball.png',
                height: screenHeight.h * 0.4,
                fit: BoxFit.contain,
              ),


              SizedBox(
                height: 50.h,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Start ',
                        style: textStyle(color: Colors.white, size: 18.sp),
                      ),
                      style: ButtonStyle(

                        elevation: MaterialStateProperty.all<double>(15.sp),
                        shadowColor: MaterialStateProperty.all<Color>(shadowColor),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mainColor),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.sp),
                          ),
                        ),
                      ),
                    ),
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
