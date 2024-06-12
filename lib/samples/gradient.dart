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
            gradient: LinearGradient(
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
