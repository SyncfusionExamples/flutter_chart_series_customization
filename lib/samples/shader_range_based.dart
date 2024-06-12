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
  double _yBase = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryXAxis: const DateTimeAxis(),
        onActualRangeChanged: (ActualRangeChangedArgs args) {
          if (args.orientation == AxisOrientation.vertical) {
            final num range = args.visibleMax.abs() + args.visibleMin.abs();
            _yBase = args.visibleMax / range;
          }
        },
        series: <CartesianSeries<ChartData, DateTime>>[
          AreaSeries(
            dataSource: dateTimeData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            color: Colors.green,
            borderColor: Colors.green,
            onCreateShader: (ShaderDetails details) {
              return ui.Gradient.linear(
                details.rect.topCenter,
                details.rect.bottomCenter,
                <Color>[
                  Colors.green,
                  Colors.green,
                  Colors.red,
                  Colors.red,
                ],
                <double>[0, _yBase, _yBase, 1],
              );
            },
          ),
        ],
      ),
    );
  }
}
