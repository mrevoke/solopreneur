import 'package:flutter/material.dart';
import 'package:solopreneuer/management/time_management.dart';
import 'package:solopreneuer/solopreneur_row.dart';

class Management extends StatefulWidget {
  const Management({super.key});

  @override
  State<Management> createState() => _ManagementState();
}

class _ManagementState extends State<Management> {
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
        TimeManagement(),
      ],
    ));
  }

  void onTextTap(String text) {
    setState(() {
      selectedText = text;
    });
    // Add your logic here for the onTap event
    // For example, you can navigate to a different screen or perform some action
  }
}
