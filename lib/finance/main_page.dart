import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/bargraph.dart';
import 'package:solopreneuer/finance/financial_goal_container.dart';
import 'package:solopreneuer/relations/appbar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double abvilableWidth = screenWidth - (screenWidth * (1.5 / 7));

    return Container(
      height: screenHeight,
      width: abvilableWidth,
      child: Column(
        children: [
          MyAppBar(),
          Row(
            children: [
              Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: Color.fromARGB(255, 141, 131, 131)))),
                width: abvilableWidth / 2.0,
                height: screenHeight * 2.5 / 4.0,
                child: const BargraphContainer(),
              ),
              Container(
                height: screenHeight * 2.5 / 4.0,
                width: abvilableWidth / 2.0,
                child: const FinancialGoalContainer(),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.23,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width *
                  0.05, // Adjust the horizontal padding as needed
              //  vertical: MediaQuery.of(context).size.height * 0.02, // Adjust the vertical padding as needed
            ),
            child: Text(
              'By strategically addressing outstanding debt, you not only alleviate financial burdens but also pave the way for increased liquidity and financial flexibility. Moreover, reinforcing your emergency savings serves as a crucial buffer, ensuring you are well-prepared to navigate any unexpected challenges that may arise. Simultaneously, reinvesting the remaining funds in carefully selected avenues positions you for potential long-term growth, fostering a sustainable and resilient financial portfolio. This holistic approach not only enhances immediate stability but also sets a solid foundation for achieving your broader financial aspirations.',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.height / 45,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
