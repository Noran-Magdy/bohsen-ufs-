import 'package:decorative_app_bar/decorative_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:ufs_update/shared/component.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
                barHeight: screenHeight.h *0.23,
                barPad: 140.r,
                radii: 100.r,
                gradient1: Colors.white,
                gradient2: mainColor,
                extra: Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                    padding:  EdgeInsetsDirectional.only(
                      top: 50.h,
                      start: 30.w,
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

                TableCalendar(
                  focusedDay: focusedDay,
                  lastDay: DateTime(2025),
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
                SizedBox(
                  height: 15.h,
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
                  height: 80.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
