import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AskPermissionScreen extends StatefulWidget {
  @override
  _AskPermissionScreenState createState() => _AskPermissionScreenState();
}

class _AskPermissionScreenState extends State<AskPermissionScreen> {
  GlobalKey _formKey = GlobalKey<FormState>();
  TextEditingController dayController = TextEditingController();
  TextEditingController fromTimeController = TextEditingController();
  TextEditingController toTimeController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  CalendarFormat format = CalendarFormat.twoWeeks;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool appear = false;
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 80,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              UniconsLine.arrow_left,
              color: Colors.black,
            ),
            iconSize: 28.sp,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Permission Request',
            style: textStyle(
              size: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if(!isValidate)
                Container(
                height: 50.h,
                color: Colors.yellow[100],
                child: Row(
                  children: [
                    SizedBox(
                      width: 3.w,
                    ),
                    Icon(UniconsLine.info_circle),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Complete all forms to submit permission request',
                      style: textStyle(size: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'The Day',
                        style: textStyle(),
                      ),

                      buildFormFiledRequest(
                        controller: fromTimeController,
                        context: context,
                        buildInkWell:    TableCalendar(
                          focusedDay: focusedDay,
                          lastDay: DateTime(2025),
                          firstDay: DateTime(2020),
                          calendarFormat: format,
                          onFormatChanged:
                              (CalendarFormat _format) {
                            setState(() {
                              format = _format;
                            });
                          },
                          //locale: 'zh_CN',
                          daysOfWeekHeight: 20,
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: textStyle(),
                            weekendStyle: textStyle(),
                          ),
                          startingDayOfWeek:
                          StartingDayOfWeek.saturday,
                          onDaySelected: (DateTime selectDay,
                              DateTime focusDay) {
                            print('focus $focusDay');
                            print('select $selectDay');
                            if (focusDay.day ==
                                DateTime.now().day) {
                              setState(() {
                                appear = false;
                                focusedDay = focusDay;
                                selectedDay = selectDay;
                              });
                            } else {
                              setState(() {
                                focusedDay = focusDay;
                                selectedDay = selectDay;
                                appear = true;
                                dayController.text = focusDay
                                    .toString()
                                    .split(' ')[0];
                              });
                              print('controller $dayController');
                              Navigator.pop(context);
                            }

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => DailyCalender(
                            //         selectedDay: focusedDay,
                            //       ),
                            //     ));
                          },
                          calendarStyle: CalendarStyle(
                            // isTodayHighlighted: true,
                            selectedTextStyle: textStyle(),
                            defaultTextStyle: textStyle(),
                            todayDecoration: BoxDecoration(
                              color: Colors.black87,
                              shape: BoxShape.circle,
                            ),
                            todayTextStyle: textStyle(
                              color: Colors.white,
                              size: 18.sp,
                            ),
                            isTodayHighlighted: true,
                            selectedDecoration: BoxDecoration(
                              color: shadowColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonShowsNext: false,
                            formatButtonTextStyle: textStyle(),
                            titleTextStyle: textStyle(),
                          ),
                          selectedDayPredicate: (DateTime date) {
                            return isSameDay(focusedDay, date);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'From Time',
                        style: textStyle(),
                      ),
                      buildFormFiledRequest(
                        controller: fromTimeController,
                        context: context,
                        buildInkWell:   createInlinePicker(
                          onChange: (TimeOfDay newTime) {
                            setState(() {
                              _time = newTime;
                              fromTimeController.text = newTime
                                  .toString()
                                  .split('(')[1]
                                  .split(')')[0];
                              print(
                                  'time controller $fromTimeController');
                            });
                            Navigator.pop(context);
                          },
                          value: _time,
                          displayHeader: true,
                          dialogInsetPadding: EdgeInsets.zero,
                          iosStylePicker: true,
                          accentColor: Colors.black,
                        ),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'To Time',
                        style: textStyle(),
                      ),
                      buildFormFiledRequest(
                        context: context,
                        buildInkWell:  createInlinePicker(
                          onChange: (TimeOfDay newTime) {
                            setState(() {
                              _time = newTime;
                              toTimeController.text = newTime
                                  .toString()
                                  .split('(')[1]
                                  .split(')')[0];
                              print(
                                  'time controller $fromTimeController');
                            });
                            Navigator.pop(context);
                          },
                          value: _time,
                          displayHeader: true,
                          dialogInsetPadding: EdgeInsets.zero,
                          iosStylePicker: true,
                          accentColor: Colors.black,
                        ),
                        controller: toTimeController,
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        'Reason',
                        style: textStyle(),
                      ),
                      buildFormFiledRequest(
                        controller: reasonController,
                        context: context,
                        buildInkWell: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  reasonController.text = 'sick';
                                });
                                Navigator.pop(context);
                              },
                              child: Text('sick'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  reasonController.text = 'travel';
                                });
                                Navigator.pop(context);
                              },
                              child: Text('travel'),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 40.h,
                      ),


                    ],
                  ),
                ),

              ),
              SizedBox(
                width: screenWidth.w * 0.6,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  child: Text(
                    'submit ',
                    style: textStyle(color: Colors.white, size: 18.sp),
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
            ],

          ),
        ),
      ),
    );
  }
}
