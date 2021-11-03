import 'package:flutter/material.dart';
import 'package:ufs_update/screens/home_screen/home_screen.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double viewInset =
        MediaQuery.of(context).viewInsets.bottom; //show keyboard open or no
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool secure = true;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Welcome Back',
                    style: textStyle(
                      size: 24,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    'assets/images/login2.png',
                    width: 250,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  defaultFormField(
                      label: 'phone number',
                      width: width,
                      type: TextInputType.numberWithOptions()),
                  defaultFormField(
                    label: 'password',
                    width: width,
                    isPassword: true,
                    type: TextInputType.visiblePassword,
                    passwordShown: () {
                      setState(() {
                        secure = !secure;
                      });
                    },
                    isSecure: secure,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      width: width * 0.88,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false);
                        },
                        child: Text(
                          'LOGIN ',
                          style: textStyle(color: Colors.black, size: 18),
                        ),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all<double>(15),
                          shadowColor:
                              MaterialStateProperty.all<Color>(shadowColor),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              mainColor.withOpacity(0.7)),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
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
        ),
      ),
    );
  }
}
