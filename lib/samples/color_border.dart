import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../model.dart';

class ColorAndBorderSample extends StatefulWidget {
  const ColorAndBorderSample({super.key});

  @override
  State<ColorAndBorderSample> createState() => _ColorAndBorderSampleState();
}

class _ColorAndBorderSampleState extends State<ColorAndBorderSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.6,
        mainAxisSpacing: 25,
        children: [
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              labelPlacement: LabelPlacement.onTicks,
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
              maximum: 120,
              interval: 20,
            ),
            series: <CartesianSeries<ChartData, String>>[
              SplineSeries(
                dataSource: categoryMidData1,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.green,
                width: 2,
                markerSettings: const MarkerSettings(isVisible: true),
              ),
            ],
          ),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
              maximum: 120,
              interval: 20,
            ),
            series: <CartesianSeries<ChartData, String>>[
              BarSeries(
                dataSource: categoryMidData2,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.indigo.withOpacity(0.2),
                borderColor: Colors.indigo,
                borderWidth: 2,
              ),
            ],
          ),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              plotOffset: 5,
              labelPlacement: LabelPlacement.onTicks,
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
            ),
            series: <CartesianSeries<ChartData, String>>[
              ScatterSeries(
                dataSource: categoryMidData1,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.teal.withOpacity(0.2),
                borderColor: Colors.teal,
                borderWidth: 2,
              ),
            ],
          ),
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(
              labelPlacement: LabelPlacement.onTicks,
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
            ),
            series: <CartesianSeries<ChartData, String>>[
              AreaSeries(
                dataSource: categoryMidData1,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.pink.withOpacity(0.2),
                borderColor: Colors.pink,
                borderWidth: 2,
                borderDrawMode: BorderDrawMode.top,
              ),
            ],
            annotations: [
              CartesianChartAnnotation(
                x: 'Jul',
                y: 113,
                widget: ColoredBox(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Text(
                    'Border Draw Mode: Top',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
              ),
            ],
          ),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              plotOffset: 1.5,
              labelPlacement: LabelPlacement.onTicks,
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              axisLine: AxisLine(width: 0),
            ),
            series: <CartesianSeries<ChartData, String>>[
              SplineAreaSeries(
                dataSource: categoryMidData1,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.purple.withOpacity(0.2),
                borderColor: Colors.purple,
                borderWidth: 2,
                borderDrawMode: BorderDrawMode.excludeBottom,
              ),
            ],
            annotations: [
              CartesianChartAnnotation(
                x: 'Jul',
                y: 113,
                widget: ColoredBox(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Text(
                    'Border Draw Mode: excludeBottom',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
              ),
            ],
          ),
          SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: const CategoryAxis(
              plotOffset: 1.5,
              labelPlacement: LabelPlacement.onTicks,
              axisLine: AxisLine(width: 0),
            ),
            primaryYAxis: const NumericAxis(
              plotOffset: 1.5,
              axisLine: AxisLine(width: 0),
              maximum: 120,
              interval: 20,
            ),
            series: <CartesianSeries<ChartData, String>>[
              StepAreaSeries(
                dataSource: categoryMidData2,
                xValueMapper: (ChartData data, int index) => data.x,
                yValueMapper: (ChartData data, int index) => data.y,
                color: Colors.blue.withOpacity(0.2),
                borderColor: Colors.blue,
                borderWidth: 2,
                borderDrawMode: BorderDrawMode.all,
              ),
            ],
            annotations: [
              CartesianChartAnnotation(
                x: 'Jul',
                y: 113,
                widget: ColoredBox(
                  color: Theme.of(context).colorScheme.surface,
                  child: const Text(
                    'Border Draw Mode: all',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                coordinateUnit: CoordinateUnit.point,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
