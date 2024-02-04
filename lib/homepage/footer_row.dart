// footer_row.dart

import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/bar_graph.dart';
import 'package:solopreneuer/finance/bargraph.dart';
//import 'package:solopreneuer/homepage/linechart.dart';
import 'package:solopreneuer/homepage/stats.dart';
import 'package:solopreneuer/marketting/piechart.dart';

class FooterRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width * (2 / 7),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * .15 / 7,
          ),
          Text(
            "Statistics",
            style: TextStyle(fontSize: screenHeight*.27/7, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: screenHeight * .2 / 7,
          ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               StatsCard(title: 'New\nClients', value: '180'),
              StatsCard(title: 'Returning\nClients', value: '80'),
            
             ],
           ),
           SizedBox(
            height: screenHeight * .15 / 7,
          ),
           Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               StatsCard(title: 'Tasks in\nProgress', value: '12'),
              StatsCard(title: 'Tasks\nFinished', value: '16'),
            
             ],
           ),

 Expanded(
            child: Image.asset(
              'images/fx.png',
              fit: BoxFit.contain, // Adjust the fit based on your preference
            ),
          ),
        ],
      ),
    );
  }
}
