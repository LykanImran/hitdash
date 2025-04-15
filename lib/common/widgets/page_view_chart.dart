import 'package:dashhit/common/widgets/base_card.dart';
import 'package:dashhit/provider/data_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageViewChart extends StatelessWidget {
  const PageViewChart({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          const Text(
            'Page Views History',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 200,
            child: Consumer<DataProvider>(
              builder: (context, data, child) {
                return LineChart(
                  LineChartData(
                    gridData: FlGridData(show: true),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: true),
                      ),
                      rightTitles: AxisTitles(),
                      topTitles: AxisTitles(),
                    ),
                    borderData: FlBorderData(show: true),
                    minX: 0,
                    maxX: data.pageViewHistory.length.toDouble() - 1,
                    minY: 0,
                    maxY: data.pageViewHistory
                            .reduce((a, b) => a > b ? a : b)
                            .toDouble() +
                        1000,
                    lineBarsData: [
                      LineChartBarData(
                        spots: data.pageViewHistory.asMap().entries.map((e) {
                          return FlSpot(e.key.toDouble(), e.value.toDouble());
                        }).toList(),
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 4,
                        isStrokeCapRound: true,
                        dotData: FlDotData(show: true),
                        belowBarData: BarAreaData(show: true),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}