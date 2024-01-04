// footer_row.dart

import 'package:flutter/material.dart';

class FooterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blue,
      width:MediaQuery.of(context).size.width * (2 / 7),
      child: Center(child: Text('2')),
    );
  }
}
