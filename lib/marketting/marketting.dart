import 'package:flutter/material.dart';
import 'package:solopreneuer/marketting/piechart.dart';

import '../solopreneur_row.dart';

class marketing extends StatefulWidget {
  @override
  _marketingState createState() => _marketingState();
}

class _marketingState extends State<marketing> {
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
          PieChartSec(),
          // Other Rows can be added similarly
        ],
      ),
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