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
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(
          maximum: 110,
        ),
        series: <CartesianSeries<ChartData, String>>[
          ColumnSeries(
            dataSource: categoryData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            color: Colors.pink[50],
            borderWidth: 2,
            borderRadius: BorderRadius.circular(10),
            borderGradient: LinearGradient(
              colors: <Color>[
                themeData.colorScheme.primary,
                themeData.colorScheme.surface,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const <double>[0, 1],
            ),
          ),
        ],
      ),
    );
  }
}
