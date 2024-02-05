// main.dart

import 'package:flutter/material.dart';
//import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:solopreneuer/finance/finance_page.dart';
import 'package:solopreneuer/finance/main_page.dart';
import 'package:solopreneuer/marketting/marketting.dart';
import 'package:solopreneuer/marketting/piechart.dart';
import 'package:solopreneuer/relations/mailsection.dart';
import 'package:solopreneuer/legal/legal.dart';
import 'package:solopreneuer/legal/legal_attempt.dart';
import 'solopreneur_row.dart';
import 'homepage/content_row.dart';
import 'homepage/footer_row.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart';
// For Auth
import 'package:solopreneuer/shared/constants.dart';
import 'package:solopreneuer/helper/helper_function.dart';
import 'package:solopreneuer/auth/login_page.dart';
import 'package:solopreneuer/homepage/homepage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  await dotenv.load(fileName: "lib/.env");

  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  } else {
    await Firebase.initializeApp();
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String selectedText = '';

  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _isSignedIn ? const HomePage() : const LoginPage(),
      // child: Scaffold(
      //   body: Row(
      //     children: [
      //       SolopreneurRow(
      //         selectedText: selectedText,
      //         onTextTap: onTextTap,
      //       ),
      //       ContentRow(),
      //       FooterRow(),

      //       // Other Rows can be added similarly
      //     ],
      //   ),
      // ),
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
