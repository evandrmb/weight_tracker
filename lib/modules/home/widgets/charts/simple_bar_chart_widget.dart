import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weight_tracker/modules/home/models/weight_register.dart';

class SimpleBarChartWidget extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  SimpleBarChartWidget(this.seriesList, {this.animate});

  factory SimpleBarChartWidget.withWeights(List<WeightRegister> list) {
    return SimpleBarChartWidget(
      _weightsSeries(list),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barRendererDecorator: charts.BarLabelDecorator<String>(),
      domainAxis: charts.OrdinalAxisSpec(),
    );
  }

  static List<charts.Series<WeightRegister, String>> _weightsSeries(
      List<WeightRegister> list) {
    return [
      charts.Series<WeightRegister, String>(
          id: 'Weights',
          colorFn: (_, __) => charts.MaterialPalette.purple.shadeDefault,
          domainFn: (WeightRegister weights, _) =>
              DateFormat('yyyy-MM-dd').format(weights.weightDate),
          measureFn: (WeightRegister weights, _) => weights.weight.value,
          data: list,
          labelAccessorFn: (WeightRegister weights, _) =>
              ('${weights.weight.value.toString()} Kg'))
    ];
  }
}
