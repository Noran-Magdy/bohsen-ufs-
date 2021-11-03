import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ufs_update/screens/graph_screen/graph_screen.dart';
import 'package:ufs_update/screens/login_screen/login_Screen.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String langValue = 'English';
  var langs = [
    'English',
    'Arabic',
  ];
  bool valuee = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBody: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsetsDirectional.only(top: 20, start: 20),
              children: [
                Text(
                  'Common',
                  style: textStyle(color: mainColor),
                ),
                Row(
                  children: [
                    Icon(Icons.language),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Language',
                      style: textStyle(size: 18),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35,
                  ),
                  child: DropdownButton(
                    dropdownColor: Colors.white,
                    style: textStyle(),
                    iconSize: 24,
                    value: langValue,
                    icon: Icon(Icons.keyboard_arrow_down_rounded),
                    isExpanded: true,
                    items: langs.map((String lang) {
                      return DropdownMenuItem(
                        child: Text(lang),
                        value: lang,
                      );
                    }).toList(),
                    onChanged: (String newValue) {
                      setState(() {
                        langValue = newValue;
                      });
                    },
                  ),
                ),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.clock,
                    label: "Ask Permission",
                    onTap: () {
                      print('gckv');
                    }),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.vuejs_alt,
                    label: "Vacation Request",
                    onTap: () {
                      print('gckv');
                    }),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.forward,
                    label: "Follow my permission Request",
                    onTap: () {
                      print('gckv');
                    }),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.forward,
                    label: "Follow my vacation Request",
                    onTap: () {
                      print('gckv');
                    }),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.graph_bar,
                    label: "My graph",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyGraphScreen(),
                          ));
                    }),
                myDivider(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Account',
                  style: textStyle(color: mainColor),
                ),
                buildAccountSetting(
                    icon: UniconsLine.envelope_info,
                    label: 'Email',
                    data: 'Mohammed@gmail.com',
                    onTap: () {}),
                myDivider(),
                buildAccountSetting(
                    icon: UniconsLine.phone_alt,
                    label: 'Phone',
                    data: '123456789',
                    onTap: () {}),
                myDivider(),
                buildCommonSetting(
                    icon: UniconsLine.signout, label: "Sign out", onTap: () {
                  Navigator.pushAndRemoveUntil(context,
                      MaterialPageRoute(builder: (context) => LoginScreen(),), (
                          route) => false);
                }),
                myDivider(),
                SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
