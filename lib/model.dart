class ChartData {
  ChartData(this.x, this.y);

  final dynamic x;
  final double y;
}

List<ChartData> numericData = [
  ChartData(0, 12),
  ChartData(1, 7),
  ChartData(2, 4),
  ChartData(3, 9),
  ChartData(4, 16),
  ChartData(5, 25),
  ChartData(6, 36),
  ChartData(7, 49),
  ChartData(8, 64),
  ChartData(9, 81),
  ChartData(10, 100),
];

List<ChartData> categoryData = [
  ChartData('Jan', 12),
  ChartData('Feb', 7),
  ChartData('Mar', 4),
  ChartData('Apr', 9),
  ChartData('May', 16),
  ChartData('Jun', 25),
  ChartData('Jul', 36),
  ChartData('Aug', 49),
  ChartData('Sep', 64),
  ChartData('Oct', 81),
  ChartData('Nov', 92),
  ChartData('Dec', 100),
];

List<ChartData> dateTimeData = [
  ChartData(DateTime(2020, 1, 1), 12),
  ChartData(DateTime(2020, 2, 1), 7),
  ChartData(DateTime(2020, 3, 1), 4),
  ChartData(DateTime(2020, 4, 1), -9),
  ChartData(DateTime(2020, 5, 1), -31),
  ChartData(DateTime(2020, 6, 1), -25),
  ChartData(DateTime(2020, 7, 1), -36),
  ChartData(DateTime(2020, 8, 1), 49),
  ChartData(DateTime(2020, 9, 1), 64),
  ChartData(DateTime(2020, 10, 1), 81),
  ChartData(DateTime(2020, 11, 1), 92),
  ChartData(DateTime(2020, 12, 1), 100),
];
