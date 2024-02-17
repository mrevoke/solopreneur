import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:solopreneuer/relations/appbar.dart';
import 'package:solopreneuer/solopreneur_row.dart';

class PieChartSec extends StatefulWidget {
  const PieChartSec({Key? key}) : super(key: key);

  @override
  _PieChartSecState createState() => _PieChartSecState();
}

class _PieChartSecState extends State<PieChartSec> {
  Map<String, double> dataMap = {"Youtube":10,};
  Map<String, double> dataMap2 = {"Youtube":20,};
  TextEditingController keyController = TextEditingController();
  TextEditingController valueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    // Fetch data from Firestore
    final firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('data').doc('dataMap').get();
    if (snapshot.exists) {
      setState(() {
        dataMap = Map<String, double>.from(snapshot.data() as Map);
      });
    }

    final snapshot2 = await firestore.collection('data').doc('dataMap2').get();
    if (snapshot2.exists) {
      setState(() {
        dataMap2 = Map<String, double>.from(snapshot2.data() as Map);
      });
    }
  }

  Future<void> updateData(Map<String, double> data, String documentName) async {
    final firestore = FirebaseFirestore.instance;
    await firestore.collection('data').doc(documentName).set(data);
  }

  Future<void> updateDataMap(String key, double value, Map<String, double> map, String documentName) async {
    setState(() {
      map[key] = value;
    });
    // Update data in Firebase
    await updateData(map, documentName);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * (5.5 / 7),
      child: Column(
        children: [
          //MyAppBar(),
          SizedBox(height: MediaQuery.of(context).size.height * 0.35 / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    'Marketing Cost',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height / 35,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 23),
                      PieChart(
                        dataMap: dataMap,
                        chartRadius: MediaQuery.of(context).size.width /
                            10, // Adjust radius as needed
                        colorList: [
                         // Colors.white,
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.pink,
                          Colors.purple,
                          Colors.lightGreen,
                          Colors.red,
                        ],
                        chartType: ChartType.ring,
                        ringStrokeWidth:
                        MediaQuery.of(context).size.width / 17,
                        // Customize other properties as desired
                        chartLegendSpacing:
                        MediaQuery.of(context).size.width / 25,
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
                      fontSize: MediaQuery.of(context).size.height / 35,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 10),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 23),
                      PieChart(
                        dataMap: dataMap2,
                        chartRadius: MediaQuery.of(context).size.width /
                            10, // Adjust radius as needed
                        colorList: [
                          //Colors.white,
                          Colors.blue,
                          Colors.green,
                          Colors.orange,
                          Colors.pink,
                          Colors.purple,
                          Colors.lightGreen,
                          Colors.red,
                        ],
                        chartType: ChartType.ring,
                        ringStrokeWidth:
                        MediaQuery.of(context).size.width / 17,
                        // Customize other properties as desired
                        chartLegendSpacing:
                        MediaQuery.of(context).size.width / 25,
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
          SizedBox(height: MediaQuery.of(context).size.height / 20),
          Container(
            width: MediaQuery.of(context).size.width * 0.65,
            // 80% of the screen width
            height: MediaQuery.of(context).size.height * 0.3,
            // 80% of the screen height
            alignment: Alignment.center,
            child: Column(
              children: [
                TextFormField(
                  controller: keyController,
                  decoration: InputDecoration(
                    labelText: 'Enter the site',
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: valueController,
                  decoration: InputDecoration(
                    labelText: 'Enter amount',
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        String key = keyController.text;
                        double value = double.parse(valueController.text);
                        if (key.isNotEmpty && value != null) {
                          await updateDataMap(key, value, dataMap, 'dataMap');
                        }
                      },
                      child: Text('Add to Marketting Cost'),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width /15,),
                    ElevatedButton(
                      onPressed: () async {
                        String key = keyController.text;
                        double value = double.parse(valueController.text);
                        if (key.isNotEmpty && value != null) {
                          await updateDataMap(key, value, dataMap2, 'dataMap2');
                        }
                      },
                      child: Text('Add to Marketting Result'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 50),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              // 80% of the screen width
              height: MediaQuery.of(context).size.height /5,
              // 80% of the screen height
              alignment: Alignment.center,
              child: Text(
                'Based on our in-depth survey findings, it is strongly recommended to prioritize substantial investments in YouTube over conventional newspapers. This suggestion stems from a keen recognition of the platforms escalating influence and its unparalleled ability to engage with a vast audience. The evolving landscape of media consumption indicates a notable shift towards digital platforms, making YouTube an optimal choice for strategic investments. Simultaneously, it is prudent to approach Instagram and Facebook with an equal level of attention. Allocating resources judiciously to both platforms can yield maximum impact, given the striking parallels observed in their user bases and content consumption patterns in our comprehensive survey data. This strategic approach aims to harness the synergies between Instagram and Facebook, optimizing outreach and resonance across these interconnected social media channels.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height / 45,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
