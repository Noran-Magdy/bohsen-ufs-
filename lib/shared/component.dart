import 'package:flutter/material.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'constant.dart';

Widget defaultFormField({
  TextEditingController controller,
  TextInputType type,
  String label,
  bool isPassword = false,
  Function passwordShown,
  bool isSecure =true,
  double width,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.w),
    padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
    width: width.w * 0.85,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      color: textFormColor,
    ),
    child: TextFormField(
      style: textStyle(),
      decoration: InputDecoration(
        border: InputBorder.none,
        // hintText: 'Phone number',
       hintText: label,
        hintStyle: textStyle(),
        labelStyle: textStyle(color: mainColor),
        focusedBorder: InputBorder.none,
        alignLabelWithHint: true,

        //  suffixText: 'show',
        suffix: isPassword
            ? InkWell(
                child: Text('show',style: textStyle(
                  color: mainColor,
                  size: 15.sp,
                ),),
                onTap: passwordShown,
              )
            : Text(
                '',
              ),
      ),
      cursorColor: mainColor,
      controller: controller,
      keyboardType: type,
      obscureText: isPassword ? isSecure : !isSecure,
    ),
  );
}

Widget buildCommonSetting({
  Function onTap,
  IconData icon,
  String label,
}) {
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 10.w),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10.w,
          ),
          Text(
            label,
            style: textStyle(size: 18.sp),
          ),
        ],
      ),
    ),
  );
}

Widget buildAccountSetting({
  IconData icon,
  String label,
  String data,
  Function onTap,
}){
  return   Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(
            label,
            style: textStyle(size: 18),
          ),
          Spacer(),
          Text(
           data,
            style: textStyle(
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    ),
  );
}

Widget myDivider(){
  return   Divider(
    color: Colors.grey[300],
  );
}