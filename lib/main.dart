// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solopreneuer/authentication/login.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:solopreneuer/finance/finance_page.dart';
import 'package:solopreneuer/finance/main_page.dart';
import 'package:solopreneuer/firebase_options.dart';
import 'package:solopreneuer/marketting/marketting.dart';
import 'package:solopreneuer/marketting/piechart.dart';
import 'package:solopreneuer/relations/mailsection.dart';
import 'package:solopreneuer/legal/legal.dart';
import 'package:solopreneuer/legal/legal_attempt.dart';
import 'solopreneur_row.dart';
import 'homepage/content_row.dart';
import 'homepage/footer_row.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
WidgetsFlutterBinding.ensureInitialized(); 
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  await dotenv.load(fileName: "lib/.env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        title: 'firebase auth example',
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return MyHomePage();
            } else {
              return LoginPage();
            }
          },
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SolopreneurRow(
            selectedText: selectedText,
            onTextTap: onTextTap,
          ),
          ContentRow(),
          FooterRow(),
          // Other Rows can be added similarly
        ],
      ),
    );
  }

  void onTextTap(String text) {
    setState(() {
      selectedText = text;
    });
    // Add your logic here for the onTap event
    // For example, you can navigate to a different screen or perform some action
  }
}
