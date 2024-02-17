import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class FinancialGoalContainer extends StatefulWidget {
  const FinancialGoalContainer({Key? key}) : super(key: key);

  @override
  _FinancialGoalContainerState createState() => _FinancialGoalContainerState();
}

class _FinancialGoalContainerState extends State<FinancialGoalContainer> {
  List<String> goals = [
    "Repay Debt",
    "Make Merch",
    "Hire Interns",
    "Buy new PC's",
    "Expand to U.S",
    "Refurnish"
  ];
  List<double> completion = [25, 60, 25, 37.5, 25.5, 37.5]; // Initial completion values

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 0.02 * screenWidth),
        child: Column(
          children: [
            SizedBox(height: screenHeight * .4 / 7),
            Text(
              'Financial Goal',
              style: TextStyle(
                fontSize: screenHeight / 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: screenHeight * .9 / 20),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2 / 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(goals.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: _buildGoalIndicator(
                          screenWidth, screenHeight, index),
                    );
                  }),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog(context);
        },
        child: Icon(Icons.edit),
      ),
    );
  }

  Widget _buildGoalIndicator(
      double screenWidth, double screenHeight, int index) {
    return LinearPercentIndicator(
      width:  screenWidth / 5,
      animation: true,
      animationDuration: 1000,
      lineHeight: 0.04 * screenHeight,
      percent: completion[index] / 100,
      center: Text(
        "${completion[index]}%",
        style: TextStyle(
            fontSize: 0.02 * screenHeight,
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
      progressColor: const Color(0xff5963ff),
      leading: Text(
        goals[index],
        style: TextStyle(
            fontSize: 0.028 * screenHeight,
            fontWeight: FontWeight.w400,
            color: Colors.black),
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  void _showEditDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Edit Goals"),
          content: SingleChildScrollView(
            child: Column(
              children: List.generate(
                goals.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Goal ${index + 1}',
                        ),
                        onChanged: (value) {
                          setState(() {
                            goals[index] = value;
                          });
                        },
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Completion Percentage',
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            completion[index] = double.tryParse(value) ?? 0;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
