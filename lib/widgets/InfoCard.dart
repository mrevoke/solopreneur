import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  Color txtColor = const Color.fromARGB(255, 252, 252, 252);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    final double fontSize = mediaQuery.size.width < 600 ? 12 : 12;

    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
            height: 350,
            width: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff091e3a),
                  Color(0xff2f80ed),
                  Color(0xff2d9ee0)
                ],
                stops: [0, 0.5, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Name: ${widget.fullName}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Skills: ${widget.skills}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Email: ${widget.email}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Location: ${widget.location}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text('Gender: ${widget.gender}',
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Citizenship ${widget.citizenship}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                // Experience box
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Experience: ${widget.experience}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ],
                )),
                // Expected D.O.B. box
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("D.O.B: ${widget.dob}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Current Salary: ${widget.currentSalary}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Expected Salary: ${widget.expectedSalary}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        child: Text("Notice Period: ${widget.noticePeriod}",
                            style: TextStyle(
                                color: txtColor,
                                fontSize: fontSize,
                                fontStyle: FontStyle.italic),
                            textAlign: TextAlign.center),
                      ),
                    )
                  ],
                )),
                Expanded(
                    child: Row(children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      child: Text(
                          "Relocatable: ${widget.isRelocatable.toString()}",
                          style: TextStyle(
                              color: txtColor,
                              fontSize: fontSize,
                              fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center),
                    ),
                  )
                ]))
              ],
            ))
      ]),
    );
  }
}
