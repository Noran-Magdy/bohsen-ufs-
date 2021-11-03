import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


TextStyle textStyle({
  bool isDecorated = false,
  Color color , double size , FontWeight weight , String family }){return TextStyle(
  fontFamily: family ?? "Jannah",
  fontWeight: weight?? FontWeight.w500,
  color: color ??Colors.black,
  fontSize: size ?? 16,
  decoration: isDecorated ?TextDecoration.underline:TextDecoration.none
    
);}
