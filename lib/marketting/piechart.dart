import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:solopreneuer/relations/appbar.dart';
import 'package:solopreneuer/solopreneur_row.dart';

Map<String, double> dataMap = {
  "Newspaper": 30,
  "Instagram": 30,
  "Youtube": 20,
  "Facebook": 20,
};
Map<String, double> dataMap2 = {
  "Newspaper": 15,
  "Instagram": 40,
  "Youtube": 20,
  "Facebook": 25,
};

class piechartsec extends StatelessWidget {
  const piechartsec({super.key});

  // String selectedText=' ';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (5.5 / 7),
      child: Column(
        children: [
          MyAppBar(),
          SizedBox(height: MediaQuery.of(context).size.height* 0.35 / 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Marketing Cost',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 17),
                      PieChart(
                        dataMap: dataMap,
                        chartRadius: MediaQuery.of(context).size.width /
                            9, // Adjust radius as needed
                        colorList: [
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.pink
                        ],
                        chartType: ChartType.ring,

                        ringStrokeWidth: MediaQuery.of(context).size.width / 14,
                        // Customize other properties as desired
                        chartLegendSpacing:
                            MediaQuery.of(context).size.width / 20,
                        legendOptions: LegendOptions(
                          showLegends: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.65,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
              ),
              Column(
                children: [
                  Text(
                    'Marketing Result',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 25,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 17),
                      PieChart(
                        dataMap: dataMap2,
                        chartRadius: MediaQuery.of(context).size.width /
                            9, // Adjust radius as needed
                        colorList: [
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.pink,
                          Colors.purple,
                        ],
                        chartType: ChartType.ring,
                        ringStrokeWidth: MediaQuery.of(context).size.width / 14,
                        // Customize other properties as desired
                        chartLegendSpacing:
                            MediaQuery.of(context).size.width / 20,
                        legendOptions: LegendOptions(
                          showLegends: true,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 6),
          Container(
  width: MediaQuery.of(context).size.width * 0.65, // 80% of the screen width
  height: MediaQuery.of(context).size.height * 0.2, // 80% of the screen height
  alignment: Alignment.center,
  child: Text(
    'Based on our in-depth survey findings, it is strongly recommended to prioritize substantial investments in YouTube over conventional newspapers. This suggestion stems from a keen recognition of the platforms escalating influence and its unparalleled ability to engage with a vast audience. The evolving landscape of media consumption indicates a notable shift towards digital platforms, making YouTube an optimal choice for strategic investments. Simultaneously, it is prudent to approach Instagram and Facebook with an equal level of attention. Allocating resources judiciously to both platforms can yield maximum impact, given the striking parallels observed in their user bases and content consumption patterns in our comprehensive survey data. This strategic approach aims to harness the synergies between Instagram and Facebook, optimizing outreach and resonance across these interconnected social media channels.',  textAlign: TextAlign.center,
    style: TextStyle(
      fontSize: MediaQuery.of(context).size.height / 45,
      color: Colors.blue,
    ),
  ),
)

        ],
      ),
    );
  }
  // void onTextTap(String text) {
  // setState(() {
  //   selectedText = text;
  // });
}
