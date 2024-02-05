// content_row.dart

import 'package:flutter/material.dart';
import 'package:solopreneuer/homepage/meetingschedule.dart';
import 'package:solopreneuer/homepage/revenue.dart';

class ContentRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(decoration: BoxDecoration(border: Border(right: BorderSide(color:Color.fromARGB(255, 141, 131, 131)))),
      width: MediaQuery.of(context).size.width * (3.5 / 7),
      height: screenHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: screenHeight * .1 / 7,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5 / 21,
              ),
              Text(
                "My Revenue",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.35 / 7),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * .05 / 7,
          ),
       Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ RevenueRow(
            country: "France",
            amount: "1800",
            percentage: "35%",
            startColor: Color(0xFF369EFF),
            middleColor: Color(0xFF2657D0),
            endColor: Color(0xFF369EFF),
            shadowColor: Color(0x66369FFF),
          ),
          RevenueRow(
            country: "Italy",
            amount: "1500",
            percentage: "30%",
            startColor: Color.fromARGB(255, 245, 59, 3),
            middleColor: Color.fromARGB(255, 210, 48, 0),
            endColor: Color.fromARGB(255, 245, 59, 3),
            shadowColor: Color.fromARGB(102, 242, 60, 5),
          ),],)
          , SizedBox(
            height: screenHeight * 0.2 / 7,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [ RevenueRow(
            country: "India",
            amount: "1500",
            percentage: "30%",
            startColor: Color(0xFF8AC53E),
            middleColor: Color(0xFF6B9F37),
            endColor: Color(0xFF8AC53E),
            shadowColor: Color(0x668AC53E),
          ),
          //SizedBox(height: screenHeight * .25 / 7),
          RevenueRow(
            country: "Russia",
            amount: "250",
            percentage: "5%",
            startColor: Color(0xFFFFD042),
            middleColor: Color.fromARGB(255, 234, 180, 20),
            endColor: Color(0xFFFFD042),
            shadowColor: Color(0x66FFD143),
          ),],),
          SizedBox(
            height: screenHeight * 0.1 / 7,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5 / 21,
              ),
              Text(
                "My Schedule",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: screenHeight * 0.25 / 7),
              ),
            ],
          ),
         MeetingWidget(title: "Meet at 8 AM", description: "Get ready it's an important one")
        , MeetingWidget(title: "Meet at 8 AM", description: "Get ready it's an important one")
         ,MeetingWidget(title: "Meet at 8 AM", description: "Get ready it's an important one")
         ,MeetingWidget(title: "Meet at 8 AM", description: "Get ready it's an important one")
        ],
      ),
    );
  }
}
