import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:unicons/unicons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyGraphScreen extends StatefulWidget {
  @override
  _MyGraphScreenState createState() => _MyGraphScreenState();
}

class _MyGraphScreenState extends State<MyGraphScreen> {
  var _tooltipBehavior = TooltipBehavior(enable: true);
  List<int> days = [];
  int index = 1;
  List<SalesData> bohsen = [];
  List<SalesData> bohsen2 = [];
  ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    days = List.generate(10, (index) => index + 1);
    bohsen = List.generate(
        31,
        (index) =>
            SalesData({index + 1}.toString(), Random().nextInt(24).toDouble()));

    bohsen2 = List.generate(
        10,
        (index) =>
            SalesData({index + 1}.toString(), Random().nextInt(24).toDouble()));
_zoomPanBehavior = ZoomPanBehavior(
  enablePinching: true,
  enableDoubleTapZooming: true,
 enableMouseWheelZooming: true,
  enablePanning: true,
  zoomMode: ZoomMode.x,
);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(UniconsLine.arrow_left,),
          iconSize: 28.sp,
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:  SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        zoomPanBehavior: _zoomPanBehavior,
        // Chart title
        title: ChartTitle(text:  'Monthly work hours analysis'),
        // Enable legend
        legend: Legend(isVisible: true),
        // Enable tooltip
        tooltipBehavior: _tooltipBehavior,
        series: <LineSeries<SalesData, String>>[
          LineSeries<SalesData, String>(
              dataSource:  bohsen,
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              // Enable data label
              color: mainColor,
              dataLabelSettings: DataLabelSettings(isVisible: true)
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
