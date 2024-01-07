import 'package:flutter/material.dart';
import 'package:solopreneuer/marketting/piechart.dart';
import 'package:solopreneuer/relations/mailsection.dart';

import '../solopreneur_row.dart';

class mailingpage extends StatefulWidget {
  @override
  _mailingpageState createState() => _mailingpageState();
}

class _mailingpageState extends State<mailingpage> {
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold( //backgroundColor: Color.fromARGB(255, 7, 150, 186),
      body: Row(
        children: [
          SolopreneurRow(
            selectedText: selectedText,
            onTextTap: onTextTap,
          ),
         mailsection()
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