import 'package:flutter/material.dart';
import 'package:solopreneuer/financial_chat/financial_attempt.dart';
import 'package:solopreneuer/legal/legal_attempt.dart';

import '../solopreneur_row.dart';

class Financial extends StatefulWidget {
  @override
  _FinancialState createState() => _FinancialState();
}

class _FinancialState extends State<Financial> {
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              SolopreneurRow(
                selectedText: selectedText,
                onTextTap: onTextTap,
              ),
            financial_page(),
              // Other Rows can be added similarly
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 20, // Adjust position as needed
            left: MediaQuery.of(context).size.width / 4, // Adjust position as needed
            child: Center(
              child: Text(
                '                                                 Write your Financial doubts, I would solve it 👇',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ),
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
