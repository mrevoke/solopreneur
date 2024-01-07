import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/main_page.dart';
import 'package:solopreneuer/solopreneur_row.dart';

class FinancePage extends StatefulWidget {
  const FinancePage({super.key});

  @override
  State<FinancePage> createState() => _FinancePageState();
}

class _FinancePageState extends State<FinancePage> {
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SolopreneurRow(
            selectedText: selectedText,
            onTextTap: onTextTap,
          ),
          MainPage(),

        ],
      )
      );
  }

  void onTextTap(String text) {
    setState(() {
      selectedText = text;
    });
    // Add your logic here for the onTap event
    // For example, you can navigate to a different screen or perform some action
  }
}



