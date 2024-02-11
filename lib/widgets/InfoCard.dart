import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
Widget buildTextContainer({
  required String text,
  required double textSize,
  required int numberOfTexts,
  Color textColor = Colors.black,
  Color backgroundColor = Colors.transparent,
}) {
  List<Widget> textWidgets = List.generate(
    numberOfTexts,
        (index) => Text(
      text,
      style: TextStyle(fontSize: textSize, color: textColor),
    ),
  );

  return Container(
    padding: EdgeInsets.all(textSize/6),
    color: backgroundColor,
    child: Row(
      children: textWidgets,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
    ),
  );
}
Widget buildTextsWithGap(String text1, String text2,double textSize, double gapWidth, double borderRadius, Color backgroundColor, Color textColor) {
return Container(
decoration: BoxDecoration(
borderRadius: BorderRadius.circular(borderRadius),
color: backgroundColor,
),
padding: EdgeInsets.all(borderRadius), // Add padding to create a gap between texts and container edges
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
children: [
Text(
text1,
style: TextStyle(fontSize: textSize,color: textColor,),
),
SizedBox(width: gapWidth), // Adjust the gap width as needed
Text(
text2,

style: TextStyle(fontSize: textSize,color: textColor),
),
],
),
);
}
class InfoCard extends StatefulWidget {
  final String? fullName;
  final String? skills;
  final String? email;
  final String? location;
  final String? gender;
  final String? citizenship;
  final String? phone;
  final String? dob;
  final String? experience;
  final String? expectedSalary;
  final String? currentSalary;
  final String? noticePeriod;
  final bool? isRelocatable;

  const InfoCard({
    Key? key,
    required this.fullName,
    required this.skills,
    required this.email,
    required this.location,
    required this.gender,
    required this.citizenship,
    required this.phone,
    required this.dob,
    required this.experience,
    required this.expectedSalary,
    required this.currentSalary,
    required this.noticePeriod,
    required this.isRelocatable,
  }) : super(key: key);

  factory InfoCard.fromMap(Map<String, dynamic> map) {
    return InfoCard(
      fullName: map['fullName'],
      skills: map['skills'],
      email: map['email'],
      location: map['location'],
      gender: map['gender'],
      citizenship: map['citizenship'],
      phone: map['phone'],
      dob: map['dob'],
      experience: map['experience'],
      expectedSalary: map['expectedSalary'],
      currentSalary: map['currentSalary'],
      noticePeriod: map['noticePeriod'],
      isRelocatable: map['isRelocatable'],
    );
  }

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  Color bgColor = Colors.indigo;
   //     yaha par se color change kardena
  @override
  Widget build(BuildContext context) {

    final double bfs = MediaQuery.of(context).size.height / 35;
    final double sfs = MediaQuery.of(context).size.height / 50;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 1.7,
      child: Card(
        color: Colors.black,      //   <<<<<<<<<<<<<<<<<<<<
        elevation: MediaQuery.of(context).size.width / 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 100),
        ),
        child: Container(
          margin: EdgeInsets.all(MediaQuery.of(context).size.width / 100,),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 5,
            height: MediaQuery.of(context).size.height / 2.4,
            child: Container(decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent.withOpacity(0.75), // Color of the shadow
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Changes position of shadow
                ),
              ],
            ),
              child: Card(color: Colors.black,      //   <<<<<<<<<<<<<<<<<<<<
                elevation: MediaQuery.of(context).size.width / 80,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width / 100,),
                ),
                child: Container(
                  color: bgColor,    //   <<<<<<<<<<<<<<<<<<<<

                  margin: EdgeInsets.all(MediaQuery.of(context).size.width / 100,),
                    width: MediaQuery.of(context).size.width / 4.5,
                  child: Column(
                     children: [
                       buildTextContainer(
                         text: "${widget.fullName}",
                         textSize: MediaQuery.of(context).size.height / 32,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(
                         text: "${widget.skills}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.green,
                         backgroundColor: bgColor,
                       ),
                       buildTextsWithGap("${widget.email}", "${widget.location}",sfs/1.3,
                           MediaQuery.of(context).size.width / 120, MediaQuery.of(context).size.width / 120, bgColor, Colors.white),
                       buildTextsWithGap("${widget.gender}", "${widget.citizenship}",sfs/1.3,
                           MediaQuery.of(context).size.width / 120, MediaQuery.of(context).size.width / 120, bgColor, Colors.white),
                       // buildTextContainer(
                       //   text: "${widget.phone}",
                       //   textSize: 20.0,
                       //   numberOfTexts: 1,
                       //   textColor: Colors.black,
                       //   backgroundColor: Colors.green,
                       // ),
                    Center(
                    child: Card(
                      color: Colors.green, // Background color
                      child: Container(
                        padding: EdgeInsets.all(sfs/6),
                        child: Text(
                          "${widget.phone}",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: MediaQuery.of(context).size.height / 55,
                          ),
                        ),
                      ),
                    ),
                    ),
                       buildTextContainer(
                         text: "D.O.B:  ${widget.dob}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(
                         text: "Expected Salary:  Rs.${widget.expectedSalary}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(
                         text: "Current Salary: Rs.${widget.currentSalary}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(
                         text: "Notice period: ${widget.noticePeriod}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(

                         text: "Ready To Relocate",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.green,
                         backgroundColor: bgColor,
                       ),
                     ],
                  ),
                ),
              ),
            ),
          ),
        )





























        // child: Container(
        //   margin: EdgeInsets.all(30),
        //   alignment: Alignment.topCenter,
        //   height: MediaQuery.of(context).size.height / 2,
        //   child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        //     Container(
        //         height: 350,
        //         width: 200,
        //         decoration: const BoxDecoration(
        //           gradient: LinearGradient(
        //             colors: [
        //               Color(0xff091e3a),
        //               Color(0xff2f80ed),
        //               Color(0xff2d9ee0)
        //             ],
        //             stops: [0, 0.5, 1],
        //             begin: Alignment.topCenter,
        //             end: Alignment.bottomCenter,
        //           ),
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Expanded(
        //                 child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Name: ${widget.fullName}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Skills: ${widget.skills}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               crossAxisAlignment: CrossAxisAlignment.center,
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Email: ${widget.email}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Location: ${widget.location}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text('Gender: ${widget.gender}',
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Citizenship ${widget.citizenship}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             // Experience box
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Experience: ${widget.experience}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 ),
        //               ],
        //             )),
        //             // Expected D.O.B. box
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("D.O.B: ${widget.dob}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 )
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Current Salary: ${widget.currentSalary}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 )
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Expected Salary: ${widget.expectedSalary}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 )
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(
        //               children: [
        //                 Expanded(
        //                   child: Container(
        //                     margin: const EdgeInsets.all(5),
        //                     child: Text("Notice Period: ${widget.noticePeriod}",
        //                         style: TextStyle(
        //                             color: txtColor,
        //                             fontSize: fontSize,
        //                             fontStyle: FontStyle.italic),
        //                         textAlign: TextAlign.center),
        //                   ),
        //                 )
        //               ],
        //             )),
        //             Expanded(
        //                 child: Row(children: [
        //               Expanded(
        //                 child: Container(
        //                   margin: const EdgeInsets.all(5),
        //                   child: Text(
        //                       "Relocatable: ${widget.isRelocatable.toString()}",
        //                       style: TextStyle(
        //                           color: txtColor,
        //                           fontSize: fontSize,
        //                           fontStyle: FontStyle.italic),
        //                       textAlign: TextAlign.center),
        //                 ),
        //               )
        //             ]))
        //           ],
        //         ))
        //   ]),
        // ),
      ),
    );
  }
}
