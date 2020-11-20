import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weight_tracker/modules/home/models/weight_register.dart';

class SimpleLineChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleLineChartWidget(this.seriesList, {this.animate});

  factory SimpleLineChartWidget.withWeights(List<WeightRegister> list) {
    return SimpleLineChartWidget(
      _weightsSeries(list),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.TimeSeriesChart(seriesList,
        animate: animate,
        dateTimeFactory: const charts.LocalDateTimeFactory(),
        defaultRenderer: charts.LineRendererConfig(includePoints: true));
  }

  static List<charts.Series<WeightRegister, DateTime>> _weightsSeries(
      List<WeightRegister> list) {
    return [
      charts.Series<WeightRegister, DateTime>(
        id: 'Weights',
        colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
        domainFn: (WeightRegister weights, _) => weights.weightDate,
        measureFn: (WeightRegister weights, _) => weights.weight.value,
        data: list,
      )
    ];
  }
}
