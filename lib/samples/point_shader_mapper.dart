import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class PointShaderSample extends StatefulWidget {
  const PointShaderSample({super.key});

  @override
  State<PointShaderSample> createState() => _PointShaderSampleState();
}

class _PointShaderSampleState extends State<PointShaderSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCircularChart(
        series: <CircularSeries<ChartData, String>>[
          PieSeries(
            dataSource: categoryData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            pointColorMapper: (datum, index) => Colors.accents[index],
            pointShaderMapper:
                (dynamic data, int index, Color color, Rect rect) {
              int firstColorIndex = -1;
              int secondColorIndex = -1;
              if (index == 0) {
                firstColorIndex = 0;
                secondColorIndex = 1;
              } else {
                final int validIndex = index % (Colors.accents.length - 1);
                firstColorIndex = validIndex - 1;
                secondColorIndex = validIndex;
              }
              return RadialGradient(
                colors: <Color>[
                  Colors.accents[firstColorIndex],
                  Colors.accents[secondColorIndex],
                ],
                stops: const <double>[0, 1],
              ).createShader(rect);
            },
          ),
        ],
      ),
    );
  }
}
