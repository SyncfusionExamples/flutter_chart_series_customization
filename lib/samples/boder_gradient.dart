import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class BorderGradientSample extends StatefulWidget {
  const BorderGradientSample({super.key});

  @override
  State<BorderGradientSample> createState() => _BorderGradientSampleState();
}

class _BorderGradientSampleState extends State<BorderGradientSample> {
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
            color: const Color.fromARGB(255, 227, 252, 251),
            borderWidth: 3,
            borderRadius: BorderRadius.circular(10),
            borderGradient: const LinearGradient(
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
