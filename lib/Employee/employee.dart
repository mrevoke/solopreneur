import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:solopreneuer/Employee/labeltext.dart';
import 'package:solopreneuer/relations/chatsection.dart';

class employee extends StatefulWidget {
  const employee({Key? key}) : super(key: key);

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController profileLinksController = TextEditingController();
  final TextEditingController relocateController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController currentCompanyController =
      TextEditingController();
  final TextEditingController graduationDateController =
      TextEditingController();
  final TextEditingController profileLink2Controller = TextEditingController();
  final TextEditingController haveVisaController = TextEditingController();
  final TextEditingController currentLocationController =
      TextEditingController();
  final TextEditingController expectedSalaryController =
      TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController noticePeriodController = TextEditingController();

  Future<void> saveDataToFirebase() async {
    try {
      String userId = FirebaseAuth.instance.currentUser?.uid ?? "";
      CollectionReference employeeCollection =
          FirebaseFirestore.instance.collection('employees');

      await employeeCollection.doc(userId).set({
        'fullName': fullNameController.text,
        'phoneNumber': phoneNumberController.text,
        'dob': dobController.text,
        'profileLinks': profileLinksController.text,
        'relocate': relocateController.text,
        'location': locationController.text,
        'salary': salaryController.text,
        'experience': experienceController.text,
        'skills': skillsController.text,
        'email': emailController.text,
        'currentCompany': currentCompanyController.text,
        'graduationDate': graduationDateController.text,
        'profileLink2': profileLink2Controller.text,
        'haveVisa': haveVisaController.text,
        'currentLocation': currentLocationController.text,
        'expectedSalary': expectedSalaryController.text,
        'gender': genderController.text,
        'noticePeriod': noticePeriodController.text,
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
                    labelText: "DOB",
                    hintText: "Type here",
                    controller: dobController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Profile Links",
                    hintText: "Type here",
                    controller: profileLinksController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Ready To Relocate",
                    hintText: "Type here",
                    controller: relocateController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Preffered Location",
                    hintText: "Type here",
                    controller: locationController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Current Salary",
                    hintText: "Type here",
                    controller: salaryController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Experience",
                    hintText: "Type here",
                    controller: experienceController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Skills",
                    hintText: "Type here",
                    controller: skillsController),
              ],
            ),

            // Second Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.055),
                LabeledTextField(
                    labelText: "Email",
                    hintText: "Type here",
                    controller: emailController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Current Company",
                    hintText: "Type here",
                    controller: currentCompanyController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Graduation Date",
                    hintText: "Type here",
                    controller: graduationDateController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Profile Link 2",
                    hintText: "Type here",
                    controller: profileLink2Controller),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Have Visa",
                    hintText: "Type here",
                    controller: haveVisaController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Current Location",
                    hintText: "Type here",
                    controller: currentLocationController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Expected Salary",
                    hintText: "Type here",
                    controller: expectedSalaryController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Gender",
                    hintText: "Type here",
                    controller: genderController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                LabeledTextField(
                    labelText: "Notice Period",
                    hintText: "Type here",
                    controller: noticePeriodController),
                SizedBox(height: MediaQuery.of(context).size.height * 0.022),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      saveDataToFirebase();
                    },
                    child: Text('Save to Firebase'),
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
