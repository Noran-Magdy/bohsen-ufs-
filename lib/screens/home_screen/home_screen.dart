import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ufs_update/screens/calender_screen/calender_screen.dart';
import 'package:ufs_update/screens/check_screen/check_screen.dart';
import 'package:ufs_update/screens/settings_screen/settings_Screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 1;
  List<Widget> screens = [
    SettingsScreen(),
    CheckScreen(),
    CalenderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: screenHeight.h * 0.16,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: EdgeInsetsDirectional.only(
            top: 40.h,
            start: 20.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                foregroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/handsome-young-man-white-t-shirt-cross-arms-chest-smiling-pleased_176420-21607.jpg?size=338&ext=jpg',
                ),
                radius: 40.r,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                'Mohammed Hussein',
                style: textStyle(
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: screens[currentIndex],
      bottomNavigationBar: DotNavigationBar(
        backgroundColor: Colors.grey[300],
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
            print(currentIndex);
          });
        },
        dotIndicatorColor: mainColor,
        items: [
          DotNavigationBarItem(
            icon: Icon(
              UniconsLine.setting,
              size: 26.w,
            ),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
          DotNavigationBarItem(
            icon: Icon(
              UniconsLine.user_check,
              size: 28.w,
            ),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
          DotNavigationBarItem(
            icon: Icon(
              UniconsLine.calendar_alt,
              size: 26.w,
            ),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
        ],
      ),
    );
  }
}
