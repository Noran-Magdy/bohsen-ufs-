import 'package:flutter/material.dart';
import 'package:ufs_update/screens/login_screen/login_Screen.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/video2.gif',
            ),
         fit: BoxFit.fill
          ),

        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // SizedBox.expand(
            //   child: FittedBox(
            //     fit: BoxFit.fill,
            //     child: SizedBox(
            //       width: _controller.value.size?.width ?? 0,
            //       height: _controller.value.size?.height ?? 0,
            //       child: VideoPlayer(_controller),
            //     ),
            //   ),
            // ),
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
                      style: textStyle(color: Colors.white, size: 20.sp),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(15.sp),
                      shadowColor: MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black26),
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
    );
  }
}
