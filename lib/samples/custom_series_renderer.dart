import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class CustomSeriesSample extends StatefulWidget {
  const CustomSeriesSample({super.key});

  @override
  State<CustomSeriesSample> createState() => _CustomSeriesSampleState();
}

class _CustomSeriesSampleState extends State<CustomSeriesSample> {
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
            width: 0.5,
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
  ColumnSegment<ChartData, num> createSegment() => _ColumnSegment();
}

class _ColumnSegment extends ColumnSegment<ChartData, num> {
  @override
  void onPaint(Canvas canvas) {
    if (segmentRect == null) {
      return;
    }
    super.onPaint(canvas); // Handles default rendering.
    final Paint midlinePaint = Paint()
      ..isAntiAlias = true
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    final Rect outerRect = segmentRect!.outerRect;
    canvas.drawLine(outerRect.centerLeft, outerRect.centerRight, midlinePaint);
  }
}
