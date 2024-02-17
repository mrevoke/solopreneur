import 'package:flutter/material.dart';
import 'package:solopreneuer/legal/legal_attempt.dart';
import '../solopreneur_row.dart';

class legal extends StatefulWidget {
  @override
  legalState createState() => legalState();
}

class legalState extends State<legal> {
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
              legal_page(),
              // Other Rows can be added similarly
            ],
          ),
          Center(
            child: Text(
              '                                  Write your Legal doubts, I would solve it 👇',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
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
  }
}
