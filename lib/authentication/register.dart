import 'package:flutter/material.dart';
import 'package:solopreneuer/authentication/login.dart';
import 'package:solopreneuer/entreprenuer_data/user_data_input.dart';
import 'package:solopreneuer/main.dart'; // Adjust the import based on your project structure
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  var options = [
    'Enterpreneur',
    'Job Seeker',
  ];
  var _currentItemSelected = "Enterpreneur";
  var role = "Enterpreneur";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The responsive part for large screens
            if (MediaQuery.sizeOf(context).height * 1.17 <
                MediaQuery.sizeOf(context).width)
              Expanded(
                child: Container(
                  height: height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF252B5C), // Dark Blue
                        Color(0xFF005BE0), // Blue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Solopreneur',
                      style: TextStyle(
                        fontSize: 48.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
              ),

            // The main login/signup part
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                  horizontal: height * 0.12,
                ),
                color: Colors.white, // Adjust the color as needed
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.2),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'Let’s',
                              style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromARGB(255, 8, 69, 119),
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' Register 👇',
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Colors.blue,
                                fontSize: 25.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      const Text(
                        'Hey, Enter your details to get sign in \nto your account.',
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: height * 0.064),

                      // Your existing code for email and password fields
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Role : ",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          DropdownButton<String>(
                            dropdownColor: Colors.blue[900],
                            isDense: true,
                            isExpanded: false,
                            iconEnabledColor: Colors.white,
                            focusColor: Colors.white,
                            items: options.map((String dropDownStringItem) {
                              return DropdownMenuItem<String>(
                                value: dropDownStringItem,
                                child: Text(
                                  dropDownStringItem,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (newValueSelected) {
                              setState(() {
                                _currentItemSelected = newValueSelected!;
                                role = newValueSelected;
                              });
                            },
                            value: _currentItemSelected,
                          ),
                        ],
                      ),

                     

                      SizedBox(height: height * 0.05),
                      Row(
                        children: [
                          Expanded(
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  signUp(
                                      emailController.text,
                                      passwordController.text,
                                      role);
                                },
                                borderRadius: BorderRadius.circular(16.0),
                                child: Ink(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width *
                                            0.01,
                                    vertical: 18.0,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16.0),
                                    color: const Color.fromARGB(
                                        255, 114, 183, 240),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      ),

                      SizedBox(height: height * 0.02),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Already have an account? Log in here",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                       SizedBox(height: height * 0.01),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String role) async {
    await _auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) => {postDetailsToFirestore(email, role)})
        .catchError((e) {});
  }

  postDetailsToFirestore(String email, String role) async {
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': emailController.text, 'role': role});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
