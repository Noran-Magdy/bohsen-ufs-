import 'package:flutter/material.dart';
import 'package:ufs_update/screens/detect_language_screen/detect_language_screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';

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
        // height: MediaQuery.of(context).size.height,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: NetworkImage(
        //       'https://i.pinimg.com/564x/cd/f8/e4/cdf8e45e45b8460d05879219fee34547.jpg',
        //     ),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Al NAJMAH  Attendance',
                textScaleFactor: 1.5,
                style: textStyle(
                  size: 20,
                  weight: FontWeight.w800,
                ),
              ),

              Image.asset(
                'assets/images/ball.png',
                height: 400,
                fit: BoxFit.contain,
              ),


              SizedBox(
                height: 50,
              ),
              Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetectLanguageScreen(),
                            ));
                      },
                      child: Text(
                        'Start ',
                        style: textStyle(color: Colors.white, size: 18),
                      ),
                      style: ButtonStyle(

                        elevation: MaterialStateProperty.all<double>(15),
                        shadowColor: MaterialStateProperty.all<Color>(shadowColor),
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
              ),
            ],
          ),
        ),
      ),

    );
  }
}
