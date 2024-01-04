// content_row.dart

import 'package:flutter/material.dart';

class ContentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.green,
      width: MediaQuery.of(context).size.width * (3.5 / 7),
      child: Center(child: Text('4')),
    );
  }
}
