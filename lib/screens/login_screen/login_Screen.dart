import 'package:flutter/material.dart';
import 'package:ufs_update/screens/home_screen/home_screen.dart';
import 'package:ufs_update/screens/pin_code_screen/pin_code_screen.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isPassword =true;

  @override
  Widget build(BuildContext context) {
    double viewInset =
        MediaQuery.of(context).viewInsets.bottom; //show keyboard open or no
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: screenHeight.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/ball3.jpeg',
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Container(
                width: screenWidth.w,
                height: screenHeight.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Back',
                      style: textStyle(
                        size: 24.sp,
                      ),
                    ),

                    SizedBox(
                      height: 40.h,
                    ),
                    defaultFormField(
                        label: 'phone number',
                        isPassword: false,
                        width: screenWidth.w,
                        type: TextInputType.numberWithOptions()),
                    defaultFormField(
                      label: 'password',
                      width: screenWidth.w,
                      isPassword: true,
                      type: TextInputType.visiblePassword,
                      passwordShown: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                        print(isPassword);
                      },
                      isSecure: isPassword,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: screenWidth.w * 0.78,
                        height: 60.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PinCodeScreen(),
                                ),
                                (route) => false);
                          },
                          child: Text(
                            'LOGIN ',
                            style: textStyle(color: Colors.black, size: 18.sp),
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all<double>(15.sp),
                            shadowColor:
                                MaterialStateProperty.all<Color>(mainColor),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                mainColor.withOpacity(0.5)),
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.transparent),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.sp),
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
      ),
    );
  }
}
