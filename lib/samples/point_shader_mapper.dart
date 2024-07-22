import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
        series: <CircularSeries<CircularChartData, String>>[
          DoughnutSeries(
            dataSource: <CircularChartData>[
              CircularChartData('2020', 20, Colors.red, Colors.orange),
              CircularChartData('2021', 50, Colors.orange, Colors.purple),
              CircularChartData('2022', 100, Colors.purple, Colors.red),
            ],
            xValueMapper: (CircularChartData data, int index) => data.x,
            yValueMapper: (CircularChartData data, int index) => data.y,
            pointShaderMapper:
                (dynamic data, int index, Color color, Rect rect) {
              return RadialGradient(
                colors: <Color>[
                  data.start,
                  data.end,
                ],
                stops: const <double>[0, 1],
              ).createShader(rect);
            },
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve,
                color: Colors.purple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CircularChartData {
  CircularChartData(this.x, this.y, this.start, this.end);

  final String x;
  final double y;
  final Color start;
  final Color end;
}
