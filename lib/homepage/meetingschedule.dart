import 'package:flutter/material.dart';

class MeetingWidget extends StatelessWidget {
  final String title;
  final String description;

  MeetingWidget({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.1 / 7),
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.15 / 7),
            Container(
              width: MediaQuery.of(context).size.width * 3.2 / 7,
              height: screenHeight * 0.57 / 7,
              decoration: ShapeDecoration(
                color: const Color.fromARGB(255, 230, 222, 222),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.06 / 7 * screenHeight),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 0.16 / 7 * screenHeight,
                      ),
                    ),
                    SizedBox(height: 0.04 / 7 * screenHeight),
                    Text(
                      description,
                      style: TextStyle(fontSize: 0.16 / 7 * screenHeight),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
