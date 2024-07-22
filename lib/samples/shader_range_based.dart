import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class RangeBasedShaderSample extends StatefulWidget {
  const RangeBasedShaderSample({super.key});

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RangeBasedShaderSample> {
  double _originColorStopY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        onActualRangeChanged: (ActualRangeChangedArgs args) {
          if (args.orientation == AxisOrientation.vertical) {
            final num range = args.visibleMax.abs() + args.visibleMin.abs();
            _originColorStopY = args.visibleMax / range;
          }
        },
        series: <CartesianSeries<ChartData, DateTime>>[
          SplineAreaSeries(
            dataSource: dateTimeData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            color: Colors.green,
            borderColor: Colors.green,
            opacity: 0.5,
            onCreateShader: (ShaderDetails details) {
              return ui.Gradient.linear(
                details.rect.topCenter,
                details.rect.bottomCenter,
                <Color>[
                  const Color.fromARGB(255, 18, 243, 26),
                  const Color.fromARGB(255, 18, 243, 26),
                  const Color.fromARGB(255, 245, 31, 15),
                  const Color.fromARGB(255, 245, 31, 15),
                ],
                <double>[0, _originColorStopY, _originColorStopY, 1],
              );
            },
          ),
        ],
      ),
    );
  }
}
