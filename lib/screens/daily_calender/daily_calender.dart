import 'package:flutter/material.dart';
import 'package:ufs_update/shared/textStyle.dart';

class DailyCalender extends StatefulWidget {
  final DateTime selectedDay;

  const DailyCalender({Key key, this.selectedDay}) : super(key: key);

  @override
  _DailyCalenderState createState() => _DailyCalenderState();
}

class _DailyCalenderState extends State<DailyCalender> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:Text(
          widget.selectedDay.toString().split(' ')[0],
          style: textStyle(),
        ),
      ),
    );
  }
}
