import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class FillGradientSample extends StatefulWidget {
  const FillGradientSample({super.key});

  @override
  State<FillGradientSample> createState() => _FillGradientSampleState();
}

class _FillGradientSampleState extends State<FillGradientSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(
          maximum: 110,
        ),
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries(
            dataSource: <ChartData>[
              ChartData('2020', 20),
              ChartData('2021', 100),
            ],
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            gradient: const LinearGradient(
              colors: <Color>[
                Colors.red,
                Colors.blue,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: <double>[0, 1],
            ),
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
