import 'package:flutter/material.dart';
import 'package:solopreneuer/relations/appbar.dart';

class MyItem {
  final String text;
  final Color fontColor;

  MyItem(this.text, this.fontColor);
}

class TimeManagement extends StatefulWidget {
  const TimeManagement({super.key});

  @override
  State<TimeManagement> createState() => _TimeManagementState();
}

class _TimeManagementState extends State<TimeManagement> {
  final List<MyItem> items = [
    MyItem('Truck with Merchs is delayed by 10 hours', Colors.red),
    MyItem('Raw materials haven\'t reached yet', Colors.red),
    MyItem('Team B is working less effectively by 80%', Colors.red),
    MyItem('Team A completed work on time', Colors.green),
    MyItem('Team A completed work on time', Colors.green),
    MyItem('Team A completed work on time', Colors.green),
    MyItem('Team A completed work on time', Colors.green),
    // Add more tasks as needed
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double abvilableWidth = screenWidth - (screenWidth * (1.5 / 7));

    return Container(
      height: screenHeight,
      width: abvilableWidth,
      child: Column(children: [
        MyAppBar(),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Time Management',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Expanded(
            child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: screenHeight * 0.1,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 195, 189, 189),
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      items[index].text,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 35,
                        color: items[index].fontColor,
                      ),
                    ),
                  )),
            );
          },
        )),
      ]),
    );
  }
}
