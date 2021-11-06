import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ufs_update/screens/home_screen/home_screen.dart';
import 'package:ufs_update/screens/login_screen/login_Screen.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinCodeScreen extends StatefulWidget {
  @override
  _PinCodeScreenState createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  String currentText;
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              UniconsLine.arrow_left,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                size: 20.sp,
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter',
                style: textStyle(color: Colors.black54, size: 20.sp),
              ),
              Text(
                'Verification Code',
                style: textStyle(weight: FontWeight.bold, size: 24.sp),
              ),
              Text(
                'Enter code sent to 123456789',
                style: textStyle(
                  color: Colors.black54,
                ),
              ),
              PinCodeTextField(
                onChanged: (String value) {
                  setState(() {
                    currentText = value;
                    print(currentText);
                  });
                },
                appContext: context,
                length: 4,
                animationType: AnimationType.scale,
                cursorColor: mainColor,
                controller: pinController,
                hintStyle: textStyle(),
                pastedTextStyle: textStyle(),
              ),
              SizedBox(
                height: 50.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: screenWidth.w * 0.3,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Row(
                        children: [
                          Icon(UniconsLine.rotate_360,color: mainColor,),
                          SizedBox(width: 5.w,),
                          Text(
                            'resend',
                            style: textStyle(
                              color: mainColor,
                            ),
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    width: screenWidth.w * 0.3,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text(
                        'Submit',
                        style: textStyle(
                          color: Colors.white,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
