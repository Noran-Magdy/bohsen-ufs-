import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ufs_update/screens/daily_calender/daily_calender.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';

class CalenderScreen extends StatefulWidget {
  @override
  _CalenderScreenState createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  CalendarFormat format = CalendarFormat.month;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool appear = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Column(
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
              padding: EdgeInsets.zero,
              children: [
                Center(
                  child: Text(
                    'My Calendar',
                    style: textStyle(),
                  ),
                ),
                // Calendar(
                //   initialDate: DateTime.now(),
                //   weekendOpacityEnable: true,
                //   previous: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(500),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.grey[300],
                //             spreadRadius: 1.5,
                //             blurRadius: 5,
                //             offset: Offset(2.0, 0.0),
                //           ),
                //         ]),
                //     child: CircleAvatar(
                //       radius: 14,
                //       backgroundColor: Colors.white,
                //       child: Icon(
                //         Icons.arrow_back_ios,
                //         size: 16,
                //         color: Colors.orange,
                //       ),
                //     ),
                //   ),
                //   next: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(500),
                //         boxShadow: [
                //           BoxShadow(
                //               color: Colors.grey[300],
                //               spreadRadius: 1.5,
                //               blurRadius: 5,
                //               offset: Offset(2.0, 0.0))
                //         ]),
                //     child: CircleAvatar(
                //       radius: 14,
                //       backgroundColor: Colors.white,
                //       child: Icon(
                //         Icons.arrow_forward_ios,
                //         size: 16,
                //         color: Colors.orange,
                //       ),
                //     ),
                //   ),
                //   space: 20,
                //   onSelected: (date) {
                //     print(date);
                //   },
                //   backgroundColor: Colors.white,
                //   activeColor: Colors.orange,
                //   textStyleDays: TextStyle(
                //       fontWeight: FontWeight.normal, color: Colors.black),
                //   textStyleWeekDay:
                //       TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                //   titleStyle:
                //       TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //   selectedStyle:
                //       TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                // ),
                TableCalendar(
                  focusedDay: focusedDay,
                  lastDay: DateTime(2023),
                  firstDay: DateTime(2020),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
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
                  startingDayOfWeek: StartingDayOfWeek.saturday,
                  onDaySelected: (DateTime selectDay, DateTime focusDay) {
                    print('focus $focusDay');
                    print('select $selectDay');
                    if (focusDay.day == DateTime.now().day) {
                      setState(() {
                        appear = false;
                        focusedDay = focusDay;
                        selectedDay = selectDay;
                      });
                    }else{
                      setState(() {
                        focusedDay = focusDay;
                        selectedDay = selectDay;
                        appear = true;
                      });
                      print(focusedDay);
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
                      size: 18,
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
                SizedBox(
                  height: 15,
                ),
                if (appear)
                  Card(
                    color: Colors.grey[200],
                    child: Column(
                      children: [
                        buildAccountSetting(
                          icon: UniconsLine.bag,
                          label: 'Shift',
                          data: 'دوام اداره نادي النجمه',
                        ),
                        buildAccountSetting(
                          icon: UniconsLine.clock,
                          label: 'Check in ',
                          data: '06:30 am',
                        ),
                        buildAccountSetting(
                          icon: UniconsLine.left_arrow_from_left,
                          label: 'Check out',
                          data: '04:30 pm',
                        ),

                      ],
                    ),
                  ),
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
