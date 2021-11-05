import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CheckScreen extends StatefulWidget {
  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      body: Container(
        child: Column(
          children: [
            Container(
              child: DecorativeAppBar(
                  barHeight: screenHeight.h *0.23,
                  barPad: 140.r,
                  radii: 100.r,
                  gradient1: Colors.white,
                  gradient2: mainColor,
                  extra: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding:  EdgeInsetsDirectional.only(
                        top: 50.h,
                        start: 30.w,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 45.h,
            ),
            Text(
              'Click  if you want to check in or out ',
              style: textStyle(size: 20),
            ),
            Text(
              'Just hold a button to submit ',
              style: textStyle(color: Colors.grey[500]),
            ),
            SizedBox(
              height: 65.h,
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 15.sp,
                  color: mainColor,
                  shadowDarkColor: Colors.black87),
              onPressed: () {
                print("onClick");
              },
              child: Container(
                height: 150.h,
                child: Center(
                  child: Text(
                    'Check',
                    style: textStyle(
                      color: Colors.white,
                      size: 24.sp,
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
