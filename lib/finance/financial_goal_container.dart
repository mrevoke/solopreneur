import "package:flutter/material.dart";
import 'package:percent_indicator/percent_indicator.dart';

class FinancialGoalContainer extends StatelessWidget {
  const FinancialGoalContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left:20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            'Financial Goal',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              color: Colors.black,
            ),
          ),
           //SizedBox(height: MediaQuery.of(context).size.height / 10),
          Column(children: [
              LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.25,
            center: const Text(
              "2 of 8",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Repay Debt",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.6,
            center: const Text(
              "3 of 5",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Make Merch",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.25,
            center: const Text(
              "2 of 8",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Hire Interns",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.375,
            center: const Text(
              "3 of 8",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Buy new PC's",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.125,
            center: const Text(
              "1 of 8",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Expand to U.S",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          LinearPercentIndicator(
            width: 400.0,
            animation: true,
            animationDuration: 1000,
            lineHeight: 20.0,
            percent: 0.375,
            center: const Text(
              "3 of 8",
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
            //linearStrokeCap: LinearStrokeCap.roundAll,
            progressColor: const Color(0xff5963ff),
            leading: const Text(
              "Refurnish",
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
            backgroundColor: Colors.grey[300],
          ),
          ],)
        ]),
      ),
    );
  }
}
