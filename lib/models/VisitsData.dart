import 'package:flutter/material.dart';

class VisitsChartData {
  List<VisitsChartData> randomData = <VisitsChartData>[];

  VisitsChartData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;

  /// Method to get chart data points.
  List<VisitsChartData> getDateTimeData() {
    return <VisitsChartData>[
      VisitsChartData(x: DateTime(1950, 3, 31), y: 80.7),
      VisitsChartData(x: DateTime(1950, 5), y: 80.2),
      VisitsChartData(x: DateTime(1950, 6, 2), y: 79.3),
      VisitsChartData(x: DateTime(1950, 7, 3), y: 78.6),
      VisitsChartData(x: DateTime(1950, 8, 4), y: 79.5),
      VisitsChartData(x: DateTime(1950, 9, 5), y: 78.9),
      VisitsChartData(x: DateTime(1950, 10, 6), y: 78.2),
      VisitsChartData(x: DateTime(1950, 11, 07), y: 77.4),
    ];
  }
}
