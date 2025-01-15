import 'package:flutter/material.dart';
import 'package:quizapp/adminpage.dart';
import 'package:quizapp/homepage.dart';
import 'package:quizapp/javapage.dart';
import 'package:quizapp/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizapp/flutterpage.dart';
import 'package:quizapp/mernpage.dart';
import 'package:quizapp/pythonpage.dart';
import 'package:quizapp/registerpage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Adminpage(),
    routes: {
      "homepage": (context) => Homepage(),
      "loginpage": (context) => Loginpage(),
      "registerpage": (context) => Registerpage(),
      "adminpage": (context) => Adminpage(),
      "flutterpage": (context) => Flutterpage(),
      "pythonpage": (context) => Pythonpage(),
      "mernpage": (context) => Mernpage(),
      "javapage": (context) => Javapage()
    },
  ));
}
