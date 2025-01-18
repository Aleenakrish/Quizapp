import 'package:flutter/material.dart';
import 'package:quizapp/additem.dart';
import 'package:quizapp/addnewitem.dart';
import 'package:quizapp/adminpage.dart';
import 'package:quizapp/exampage.dart';
import 'package:quizapp/homepage.dart';

import 'package:quizapp/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:quizapp/registerpage.dart';
import 'package:quizapp/resultpage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    home: Loginpage(),
    routes: {
      "additem": (context) => Additem(),
      "addnewitem": (context) => Addnewitem(),
      "homepage": (context) => Homepage(),
      "loginpage": (context) => Loginpage(),
      "registerpage": (context) => Registerpage(),
      "exampage": (context) => Exampage(),
      // "adminpage": (context) => Adminpage(),

      "resultpage": (context) => ResultPage()
    },
  ));
}
