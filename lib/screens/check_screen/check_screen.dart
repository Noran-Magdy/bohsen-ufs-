import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';

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
                  barHeight: 200,
                  barPad: 170,
                  radii: 100,
                  gradient1: Colors.white,
                  gradient2: mainColor,
                  extra: Align(
                    alignment: AlignmentDirectional.topStart,
                    child: Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 50,
                        start: 30,
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: 50,
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
              height: 80,
            ),
            NeumorphicButton(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape: NeumorphicBoxShape.circle(),
                  depth: 20,
                  color: mainColor,
                  shadowDarkColor: Colors.black87),
              onPressed: () {
                print("onClick");
              },
              child: Container(
                height: 180,
                child: Center(
                  child: Text(
                    'Check',
                    style: textStyle(
                      color: Colors.white,
                      size: 24,
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
