import 'package:solopreneuer/finance/individual_bar.dart';


class BarData {
  final double expense;
  final double income;
  final double saving;
  final double debt;

  BarData({
    required this.expense,
    required this.income,
    required this.saving,
    required this.debt,
  });

  List<IndividualBar> barData=[];

  void initalizeBarData() {
    barData = [
      //expense
      IndividualBar(x: 0, y: expense),
      //expense
      IndividualBar(x: 1, y: income),
      //expense
      IndividualBar(x: 2, y: saving),
      //expense
      IndividualBar(x: 3, y: debt),
    ];
  }
}
