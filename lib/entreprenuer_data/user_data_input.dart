import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solopreneuer/Employee/labeltext.dart';
import 'package:solopreneuer/authentication/login.dart';
import 'package:solopreneuer/homepage/homepage.dart';
import 'package:solopreneuer/marketting/piechart.dart';
import 'package:solopreneuer/relations/chatsection.dart';
import 'package:solopreneuer/widgets/InfoCard.dart';

class user_data_input extends StatefulWidget {
  const user_data_input({Key? key}) : super(key: key);

  @override
  State<user_data_input> createState() => _user_data_inputState();
}

class _user_data_inputState extends State<user_data_input> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController revenueGrowthRateController = TextEditingController();
  final TextEditingController profitMariginController = TextEditingController();
  final TextEditingController MarketSizeController = TextEditingController();
  final TextEditingController CompetitionController = TextEditingController();
  final TextEditingController LegalCompilanceStatusController = TextEditingController();
  final TextEditingController CutomerAcquistionCostController = TextEditingController();

  Future<void> saveDataToFirebase() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
      CollectionReference entrepreneurCollection =
      FirebaseFirestore.instance.collection('entrepreneur');

      await entrepreneurCollection.doc(userId).set({
        'fullName': fullNameController.text,
        'phoneNumber': phoneNumberController.text,
        'dob': revenueGrowthRateController.text,
        'profitMarigin': profitMariginController.text,
        'MarketSize': MarketSizeController.text,
        'Competition': CompetitionController.text,   // location == citizenship
        'LegalCompilanceStatus': LegalCompilanceStatusController.text,
        'CutomerAcquistionCost': CutomerAcquistionCostController.text,
      });

      print('Data saved to Firestore');
    } catch (error) {
      print('Error saving data to Firestore: $error');
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 238, 238, 238)!, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // First Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                LabeledTextField(
                    labelText: "Full Name",
                    hintText: "Type here",
                    controller: fullNameController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Phone Number",
                    hintText: "Type here",
                    controller: phoneNumberController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Expected Revenue Growth Rate",
                    hintText: "Type here",
                    controller: revenueGrowthRateController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Profit Margin",
                    hintText: "Type here",
                    controller: profitMariginController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Marget Size",
                    hintText: "Enter YES or NO",
                    controller: MarketSizeController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Competition in Market",   // preferrred location == citizenship
                    hintText: "Type here",
                    controller: CompetitionController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Legal Compilance Status",
                    hintText: "Type here",
                    controller: LegalCompilanceStatusController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Customer Acquisition Cost",
                    hintText: "Type here",
                    controller: CutomerAcquistionCostController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      saveDataToFirebase().then((_) => {
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => MyHomePage())),
                      });
                    },

                    child: const Text('Save to Firebase'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
