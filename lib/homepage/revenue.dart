import 'package:flutter/material.dart';

class RevenueRow extends StatelessWidget {
  final String country;
  final String amount;
  final String percentage;
  final Color startColor;
  final Color middleColor;
  final Color endColor;
  final Color shadowColor;

  RevenueRow({
    required this.country,
    required this.amount,
    required this.percentage,
    required this.startColor,
    required this.middleColor,
    required this.endColor,
    required this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * (1.5 / 7),
          height: screenHeight * 1.5 / 7,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [startColor, middleColor, endColor],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 30,
                offset: Offset(0, 10),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .12 / 7,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeight * 0.1 / 7,
                  ),
                  Text(
                    country,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.3 / 7,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1 / 7,
                  ),
                  Text(
                    '\$$amount',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenHeight * 0.4 / 7,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.1 / 7,
                  ),
                  Container(
                    width: screenHeight * 0.3 / 7,
                    height: screenHeight * 0.3 / 7,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        percentage,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: screenHeight * 0.14 / 7,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
