import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/bargraph.dart';
import 'package:solopreneuer/finance/financial_goal_container.dart';


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
          Row(
            children: [
              Container(
                  decoration: BoxDecoration(border: Border(right: BorderSide(color:Color.fromARGB(255, 141, 131, 131)))),
                  width: abvilableWidth / 2.0,
                  height: screenHeight * 3 / 4.0,
                  child: BargraphContainer(),
              ),
              Container(
                height: screenHeight * 3 / 4.0,
                width: abvilableWidth / 2.0,
                child: FinancialGoalContainer(),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
                'By strategically addressing outstanding debt, you not only alleviate financial burdens but also pave the way for increased liquidity and financial flexiblity. Moreover, reinforcing your emergency savings serves as a curucial buffer, ensuring you are well-prepared to navigate any unexpected challenges that may arise. Simultensouly, reinvesting the remaning funds in carefully selected avenues positions you for potential long-term growth, fostering a sustainable and resilient financial portfolio. This holistic approch not only enhances immediate stability but also sets a solid foundation for achieving your border financial aspirations.',  
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
