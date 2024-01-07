// solopreneur_row.dart

import 'package:flutter/material.dart';
import 'package:solopreneuer/finance/finance_page.dart';
import 'package:solopreneuer/main.dart';
import 'package:solopreneuer/marketting/marketting.dart';
import 'package:solopreneuer/relations/mailing.dart';

class SolopreneurRow extends StatelessWidget {
  final String selectedText;
  final Function(String) onTextTap;

  SolopreneurRow({required this.selectedText, required this.onTextTap});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width * (1.5 / 7),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                right: BorderSide(color: Color.fromARGB(228, 83, 92, 78)))),
        child: Column(
          children: [
            // Solopreneur
            Padding(
              padding: EdgeInsets.only(
                left: screenHeight * 0.03,
                top: screenHeight * 0.03,
                right: screenHeight * 0.03,
              ),
              child: Container(
                child: Text(
                  'Solopreneur',
                  style: TextStyle(
                    color: Color(0xFF006DD3),
                    fontSize: screenHeight * 0.04,
                    fontFamily: 'Hanuman',
                    fontWeight: FontWeight.w700,
                    letterSpacing: screenHeight * 0.002,
                  ),
                ),
              ),
            ),

            // Your own Co-Founder
            Container(
              child: Text(
                'Your own Co-Founder',
                style: TextStyle(
                  color: Color(0xFF369EFF),
                  fontSize: screenHeight * 0.02,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  letterSpacing: screenHeight * 0.001,
                ),
              ),
            ),

            // Gap
            SizedBox(height: screenHeight * 0.07),

            // Overview
            GestureDetector(
              onTap: () {
               
                 Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                ); onTextTap('Overview');
              },
              child: Container(
                child: Text(
                  'Overview',
                  style: TextStyle(
                    color: selectedText == 'Overview'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            // Gap
            SizedBox(height: screenHeight * 0.05),

            // Strategic Planning
            GestureDetector(
              onTap: () {
               
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => marketing()),
                ); onTextTap('Strategic Planning');
              },
              child: Container(
                child: Text(
                  'Strategic Planning',
                  style: TextStyle(
                    color: selectedText == 'Strategic Planning'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Finance
            GestureDetector(
              onTap: () {
                 Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FinancePage()),
                ); 
                onTextTap('Finance');
              },
              child: Container(
                child: Text(
                  'Finance',
                  style: TextStyle(
                    color: selectedText == 'Finance'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.05),

            // Compliance & Legal
            GestureDetector(
              onTap: () {
                onTextTap('Compliance & Legal');
              },
              child: Container(
                child: Text(
                  'Compliance & Legal',
                  style: TextStyle(
                    color: selectedText == 'Compliance & Legal'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // Relations
            GestureDetector(
              onTap: () {
                onTextTap('Relations');
                
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mailingpage()),
                ); 
              },
              child: Container(
                child: Text(
                  'Relations',
                  style: TextStyle(
                    color: selectedText == 'Relations'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            // Gap
            SizedBox(height: screenHeight * 0.05),

            // Management
            GestureDetector(
              onTap: () {
                onTextTap('Management');
              },
              child: Container(
                child: Text(
                  'Management',
                  style: TextStyle(
                    color: selectedText == 'Management'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05),

            // HELP
            GestureDetector(
              onTap: () {
                onTextTap('HELP');
              },
              child: Container(
                child: Text(
                  'HELP',
                  style: TextStyle(
                    color: selectedText == 'HELP'
                        ? Colors.blue
                        : Color(0xFFBDBDBD),
                    fontSize: screenHeight * 0.018,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            // Add more text sections as needed
          ],
        ),
      ),
    );
  }
}
