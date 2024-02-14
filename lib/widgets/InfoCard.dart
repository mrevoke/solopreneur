import 'package:flutter/material.dart';
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
    padding: EdgeInsets.all(textSize/4),
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
mainAxisAlignment: MainAxisAlignment.spaceAround, // Adjust alignment as needed
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
  final String? currentLocation;
  final String? gender;
  final String? citizenship;
  final String? phone;
  final String? dob;
  final String? experience;
  final String? expectedSalary;
  final String? currentSalary;
  final String? noticePeriod;
  final String? relocate;

  const InfoCard({
    Key? key,
    required this.fullName,
    required this.skills,
    required this.email,
    required this.currentLocation,
    required this.gender,
    required this.citizenship,
    required this.phone,
    required this.dob,
    required this.experience,
    required this.expectedSalary,
    required this.currentSalary,
    required this.noticePeriod,
    required this.relocate,
  }) : super(key: key);

  factory InfoCard.fromMap(Map<String, dynamic> map) {
    return InfoCard(
      fullName: map['fullName'],
      skills: map['skills'],
      email: map['email'],
      currentLocation: map['currentLocation'],
      gender: map['gender'],
      citizenship: map['citizenship'],
      phone: map['phoneNumber'],
      dob: map['dob'],
      experience: map['experience'],
      expectedSalary: map['expectedSalary'],
      currentSalary: map['salary'],
      noticePeriod: map['noticePeriod'],
      relocate: map['relocate'],
      //resp=widget.isRelocatable.toString();
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

    //final double bfs = MediaQuery.of(context).size.width / 35;
    final double sfs = MediaQuery.of(context).size.width / 80;

    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.height / 1.3,
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
                         textSize: MediaQuery.of(context).size.width / 59,
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
                       buildTextsWithGap("${widget.email}", "${widget.currentLocation}",sfs,
                           MediaQuery.of(context).size.width / 260, MediaQuery.of(context).size.width / 160, bgColor, Colors.white),
                       buildTextsWithGap("${widget.gender}", "${widget.citizenship}",sfs,
                           MediaQuery.of(context).size.width / 260, MediaQuery.of(context).size.width / 160, bgColor, Colors.white),
                    Center(
                    child: Card(
                      color: Colors.green, // Background color
                      child: Container(
                        padding: EdgeInsets.all(sfs/3),
                        child: Text(
                          "${widget.phone}",
                          style: TextStyle(
                            color: Colors.white, // Text color
                            fontSize: MediaQuery.of(context).size.width / 69,
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
                         text: "Expected Salary: ₹.${widget.expectedSalary}",
                         textSize: sfs,
                         numberOfTexts: 1,
                         textColor: Colors.white,
                         backgroundColor: bgColor,
                       ),
                       buildTextContainer(
                         text: "Current Salary: ₹.${widget.currentSalary}",
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
                       if(((widget.relocate))=="YES")
                         buildTextContainer(
                           text: "Ready To Relocate",
                           textSize: sfs,
                           numberOfTexts: 1,
                           textColor: Colors.green,
                           backgroundColor: bgColor,
                         ),
                       if(((widget.relocate))=="NO")
                         buildTextContainer(
                           text: "NOT Ready To Relocate",
                           textSize: sfs,
                           numberOfTexts: 1,
                           textColor: Colors.red,
                           backgroundColor: bgColor,
                         ),
                     ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
