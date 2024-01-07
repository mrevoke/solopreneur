import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/bar_graph.dart';

class BargraphContainer extends StatefulWidget {
  const BargraphContainer({super.key});

  @override
  State<BargraphContainer> createState() => _BargraphContainerState();
}

class _BargraphContainerState extends State<BargraphContainer> {
  List<double> amountSummary=[
    20,
    35,
    10,
    20
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
         SizedBox(height:MediaQuery.of(context).size.height *.4/7),
           Text(
                  'Money Flow',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                    
                  ),
                ),
         SizedBox(height:MediaQuery.of(context).size.height *.4/7),

          Container(alignment: Alignment.center,
            child: SizedBox(
              height: MediaQuery.of(context).size.height*3/7,
              width: 500,
              child: MyBarGraph(
                amountSummary: amountSummary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
