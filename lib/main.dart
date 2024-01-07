// main.dart

import 'package:flutter/material.dart';
import 'package:solopreneuer/marketting/piechart.dart';
import 'package:solopreneuer/relations/mailsection.dart';
import 'solopreneur_row.dart';
import 'homepage/content_row.dart';
import 'homepage/footer_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          ContentRow(),
          FooterRow(),
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
