import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:ufs_update/screens/calender_screen/calender_screen.dart';
import 'package:ufs_update/screens/check_screen/check_screen.dart';
import 'package:ufs_update/screens/settings_screen/settings_Screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';

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

     toolbarHeight: 140,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 45,
            start: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                foregroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://img.freepik.com/free-photo/handsome-young-man-white-t-shirt-cross-arms-chest-smiling-pleased_176420-21607.jpg?size=338&ext=jpg',
                ),
                radius: 48,
              ),
              SizedBox(
                width: 10,
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

      body:screens[currentIndex],
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
            icon: Icon(UniconsLine.setting,size: 26,),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
          DotNavigationBarItem(
            icon: Icon(UniconsLine.user_check,size: 30,),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
          DotNavigationBarItem(
            icon: Icon(UniconsLine.calendar_alt,size: 26,),
            selectedColor: mainColor,
            unselectedColor: Colors.black45,
          ),
        ],
      ),
      // bottomNavigationBar: SalomonBottomBar(
      //   itemPadding: EdgeInsets.all(20),
      //   currentIndex: currentIndex,
      //   onTap: (i) {
      //     setState(() {
      //       currentIndex = i;
      //     });
      //   },
      //   unselectedItemColor: Colors.grey[500],
      //   selectedItemColor:mainColor ,
      //   items: [
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.settings_rounded),
      //       title: Text(
      //         'settings',
      //         style: textStyle(),
      //       ),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.calendar_today),
      //       title: Text(
      //         'calender',
      //         style: textStyle(),
      //       ),
      //     ),
      //     SalomonBottomBarItem(
      //       icon: Icon(Icons.home_filled),
      //       title: Text(
      //         'today',
      //         style: textStyle(),
      //       ),
      //     ),
      //   ],
      // ),

      // bottomNavigationBar: Container(
      //   height: 50,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: 15,
      //     ),
      //     child: Row(
      //       children: [
      //         InkWell(
      //           onTap: (){},
      //           child: Container(
      //             width: 65,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(60),
      //               color: mainColor,
      //             ),
      //             child: Icon(
      //               Icons.settings_rounded,
      //               size: 27,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           width: 2,
      //         ),
      //         InkWell(
      //           onTap: (){},
      //           child: Container(
      //             width: 90,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(60),
      //               color: mainColor,
      //             ),
      //             child: Icon(
      //               Icons.calendar_today,
      //               size: 30,
      //               color: Colors.white,
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           width: 3,
      //         ),
      //         InkWell(
      //           onTap: (){},
      //           child: Container(
      //             width: 200,
      //             height: 50,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(60),
      //               color: mainColor,
      //             ),
      //             child: Center(
      //               child: Text(
      //                 'Today',
      //                 style: textStyle(
      //                   color: Colors.white,
      //                   size: 20,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
