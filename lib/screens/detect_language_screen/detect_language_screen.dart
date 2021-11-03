import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ufs_update/screens/login_screen/login_Screen.dart';
import 'package:ufs_update/screens/welcome_screen/welcom_screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';

class DetectLanguageScreen extends StatefulWidget {
  @override
  _DetectLanguageScreenState createState() => _DetectLanguageScreenState();
}

class _DetectLanguageScreenState extends State<DetectLanguageScreen> {
  String langValue = 'English';
  var langs = [
    'English',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Which language do you prefer?',
                style: textStyle(
                  size: 26,
                  weight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'assets/images/lang.png',
                height: 150,
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: DropdownButton(
                  dropdownColor: Colors.white,
                  style: textStyle(
                    size: 20,
                  ),
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Next ',
                      style: textStyle(color: Colors.white, size: 18),
                    ),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all<double>(15),
                      shadowColor:
                          MaterialStateProperty.all<Color>(shadowColor),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(mainColor),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
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
