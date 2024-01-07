import "package:flutter/material.dart";
import "package:fl_chart/fl_chart.dart";
import "package:solopreneuer/finance/bar_data.dart";


class MyBarGraph extends StatelessWidget {
  final List amountSummary;
  const MyBarGraph({
    super.key,
    required this.amountSummary,
  });

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
        expense: amountSummary[0],
        income: amountSummary[1],
        saving: amountSummary[2],
        debt: amountSummary[3]);
    myBarData.initalizeBarData();

    return BarChart(
      BarChartData(
        maxY: 35,
        minY: 0,
        gridData: const FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false
        ),
        borderData: FlBorderData(
          show: true,
          border:  const Border(
            bottom: BorderSide(color: Colors.black),
            top: BorderSide(color: Colors.grey)
          )
        ),
        titlesData: const FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true,getTitlesWidget: getBottomTitles))
        ),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(
                  x: data.x, 
                  barRods: [
                    BarChartRodData(
                      toY: data.y,
                      width: 40,
                      borderRadius: BorderRadius.circular(2),
                      backDrawRodData: BackgroundBarChartRodData(
                        show: true,
                        toY: 35,
                        color: Colors.blueGrey[100]
                      ),
                    )
                  ],
                ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles (double value,TitleMeta meta){
  const style=TextStyle(color: Color.fromARGB(148, 0, 0, 0),fontSize: 12,fontWeight: FontWeight.bold);

  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Expense',style: style,);
      break;
    case 1:
      text = const Text('Income',style: style,);
      break;
    case 2:
      text = const Text('Saving',style: style,);
      break;
    case 3:
      text = const Text('Debt',style: style,);
      break;
    default:
      text = const Text('Debt',style: style,);
      break;
  }

  return SideTitleWidget( axisSide: meta.axisSide,child: text,);
}
