import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ufs_update/shared/constant.dart';
import 'package:ufs_update/shared/textStyle.dart';
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

  @override
  void initState() {
    days = List.generate(10, (index) => index + 1);
    bohsen = List.generate(
        10,
        (index) =>
            SalesData({index + 1}.toString(), Random().nextInt(24).toDouble()));

    bohsen2 = List.generate(
        10,
        (index) =>
            SalesData({index + 1}.toString(), Random().nextInt(24).toDouble()));

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
      body: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          title: ChartTitle(
            text: 'Monthly work hours analysis',
            textStyle: textStyle(),
          ),
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip\
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            // ColumnSeries<SalesData, String>(
            //     dataSource: bohsen,
            //     xValueMapper: (SalesData sales, _) => sales.year,
            //     yValueMapper: (SalesData sales, _) => sales.sales,
            //     // Enable data label
            //     name: 'Bohsen',
            //     color: mainColor,
            //     xAxisName: 'Days',
            //     yAxisName: 'Hours',
            //     isVisibleInLegend: true,
            //     isVisible: true,
            //     dataLabelSettings: DataLabelSettings(isVisible: true)),
            // ColumnSeries<SalesData, String>(
            //     dataSource: bohsen2,
            //     xValueMapper: (SalesData sales, _) => sales.year,
            //     yValueMapper: (SalesData sales, _) => sales.sales,
            //     // Enable data label
            //     name: 'Bohsen',
            //     color: Colors.purple,
            //     xAxisName: 'Days',
            //     yAxisName: 'Hours',
            //     isVisibleInLegend: true,
            //     isVisible: true,
            //     dataLabelSettings: DataLabelSettings(isVisible: true)),
            StackedColumn100Series<SalesData, String>(
              dataSource: bohsen,

              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales,
              width: 0.8, // Width of the columns
              spacing: 0.2 ,   // pacing between the columns
              color: mainColor,
              borderRadius: BorderRadius.circular(5),
              borderWidth: 2,
            ),
            StackedColumn100Series<SalesData, String>(
                dataSource: bohsen2,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                width: 0.8, // Width of the columns
                spacing: 0.2, // Spacing between the columns
                color: Colors.grey[300],
                borderColor: Colors.white,
                borderRadius: BorderRadius.circular(5),
                borderWidth: 2
            ),
          ]),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
