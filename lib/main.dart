import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ufs_update/screens/welcome_screen/welcom_screen.dart';
import 'package:ufs_update/shared/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(screenWidth, screenHeight),
      builder: () => MaterialApp(
        theme: ThemeData(
          primaryColor: mainColor,
         primarySwatch: myGreen,
        ),
        debugShowCheckedModeBanner: false,
        home: WelcomeScreen(),
      ),
    );
  }
}
