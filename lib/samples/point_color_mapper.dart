import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class ColorMapperSample extends StatefulWidget {
  const ColorMapperSample({super.key});

  @override
  State<ColorMapperSample> createState() => _ColorMapperSampleState();
}

class _ColorMapperSampleState extends State<ColorMapperSample> {
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
            dataSource: categoryData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            pointColorMapper: (ChartData data, int index) {
              if (index == 0) {
                return Colors.accents[0];
              } else {
                return Colors.accents[Colors.accents.length % index];
              }
            },
            markerSettings: const MarkerSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}
