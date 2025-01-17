// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:quizapp/adminpage.dart';
// import 'package:quizapp/homepage.dart';
// import 'package:quizapp/loginpage.dart';

// class Mainpage extends StatefulWidget {
//   const Mainpage({super.key});

//   @override
//   State<Mainpage> createState() => _MainpageState();
// }

// class _MainpageState extends State<Mainpage> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         return snapshot.hasData ? Homepage() : Loginpage();
//       },
//     );
//   }
// }
