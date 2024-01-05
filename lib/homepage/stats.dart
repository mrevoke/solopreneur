// stats_card.dart

import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String value;

  StatsCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 1.4 / 7,
      width: MediaQuery.of(context).size.width * .8 / 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight * .2 / 7,),
          Row(
            children: [
              SizedBox(width: MediaQuery.of(context).size.width * .1 / 7,),
              Text(
                '$title',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenHeight * .15 / 7,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.bold,
                  height: 0,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * .2 / 7,),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "$value ",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: screenHeight * .4 / 7,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromARGB(255, 166, 212, 255),
            Color.fromARGB(255, 2, 140, 253),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
