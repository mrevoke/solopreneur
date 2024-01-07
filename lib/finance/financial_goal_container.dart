import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';

class FinancialGoalContainer extends StatelessWidget {
  const FinancialGoalContainer({Key? key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 0.02 * screenWidth),
        child: Column(
          children: [
            SizedBox(height: screenHeight*.4/7),
            Text(
              'Financial Goal',
              style: TextStyle(
                fontSize: screenHeight / 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight*.9/7),
            Row(
              children: [SizedBox(width: MediaQuery.of(context).size.width*0.2/7,),
                Column(crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth, // 2/7 of screen width
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight, // 1/25 of screen height
                      percent: 0.25,
                      center: Text(
                        "2 of 8",
                        style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading:Text(
                        "Repay Debt",
                        style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight,
                      percent: 0.6,
                      center: Text(
                        "3 of 5",
                        style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading: Text(
                        "Make Merch",
                        style: TextStyle(
                            fontSize: 0.028* screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight,
                      percent: 0.25,
                      center: Text(
                        "2 of 8",
                        style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading: Text(
                        "Hire Interns",
                        style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight,
                      percent: 0.375,
                      center: Text(
                        "3 of 8",
                        style: TextStyle(
                            fontSize: 0.02* screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading: Text(
                        "Buy new PC's",
                        style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight,
                      percent: 0.125,
                      center: Text(
                        "1 of 8",
                        style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading:  Text(
                        "Expand to U.S",
                        style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                    SizedBox(height: 0.02 * screenHeight),
                    LinearPercentIndicator(
                      width: 1.5/7 * screenWidth,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 0.04 * screenHeight,
                      percent: 0.375,
                      center:  Text(
                        "3 of 8",
                        style: TextStyle(
                            fontSize: 0.02 * screenHeight,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      progressColor: const Color(0xff5963ff),
                      leading:  Text(
                        "Refurnish",
                        style: TextStyle(
                            fontSize: 0.028 * screenHeight,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                      backgroundColor: Colors.grey[300],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}