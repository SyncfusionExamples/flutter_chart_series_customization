import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class CustomSegmentSample extends StatefulWidget {
  const CustomSegmentSample({super.key});

  @override
  State<CustomSegmentSample> createState() => _CustomSegmentSampleState();
}

class _CustomSegmentSampleState extends State<CustomSegmentSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfCartesianChart(
        primaryYAxis: const NumericAxis(
          maximum: 110,
        ),
        series: <CartesianSeries<ChartData, num>>[
          ColumnSeries(
            dataSource: numericData,
            xValueMapper: (ChartData data, int index) => data.x,
            yValueMapper: (ChartData data, int index) => data.y,
            onCreateRenderer: (ChartSeries<ChartData, num> series) {
              return _ColumnSeriesRenderer();
            },
          ),
        ],
      ),
    );
  }
}

class _ColumnSeriesRenderer extends ColumnSeriesRenderer<ChartData, num> {
  @override
  void customizeSegment(ChartSegment segment) {
    super.customizeSegment(segment);
    if (segment.currentSegmentIndex == 5) {
      segment.fillPaint.color = Colors.red;
    }
  }
}
