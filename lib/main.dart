// main.dart

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:solopreneuer/authentication/login.dart';
import 'package:solopreneuer/authentication/register.dart';
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
        home: RegisterPage());
  }
}



