import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../config/styles.dart';

class CovidBarChart extends StatelessWidget {
  final List<double> covidCases;

  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  const CovidBarChart({
    Key? key,
    required this.covidCases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Daily New Cases',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              width: MediaQuery.of(context).size.width * 0.85,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 16.0,
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        getTitlesWidget: _getBottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30.0,
                        getTitlesWidget: _getSideTitles
                      )
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    checkToShowHorizontalLine: (value) => value % 5 == 0,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.black12,
                      strokeWidth: 1.0,
                      dashArray: [5],
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: covidCases
                      .asMap()
                      .map((key, value) => MapEntry(
                      key,
                      BarChartGroupData(
                        x: key,
                        barRods: [
                          BarChartRodData(
                            toY: value,
                            color: Colors.red[400],
                          ),
                        ],
                      )))
                      .values
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget _getBottomTitles(double value, TitleMeta meta) {
    const style = Styles.chartLabelStyle;
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('May 24', style: style);
        break;
      case 1:
        text = const Text('May 25', style: style);
        break;
      case 2:
        text = const Text('May 26', style: style);
        break;
      case 3:
        text = const Text('May 27', style: style);
        break;
      case 4:
        text = const Text('May 28', style: style);
        break;
      case 5:
        text = const Text('May 29', style: style);
        break;
      case 6:
        text = const Text('May 30', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      angle: 11.994,
      child: text,
    );
  }

  Widget _getSideTitles(double value, TitleMeta meta) {
    const style = Styles.chartLabelStyle;
    Widget text;

    if (value == 0) {
      text = const Text('0', style: style);
    } else if (value % 3 == 0) {
      text = const Text('', style: style);
    } else {
      text = Text('${value ~/ 5 * 5}K', style: style);
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      //space: 16,
      child: text,
    );
  }
}
