import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/adminpage.dart';
import 'package:quizapp/homepage.dart';
import 'package:quizapp/loginpage.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _cpassword = TextEditingController();

  // Future register() async {
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _email.text.trim(), password: _password.text.trim());
  // }
  // Future<void> registerUser() async {
  //   try {
  //     // Create user
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: _email.text.trim(),
  //       password: _password.text.trim(),
  //     );

  //     // Save user data in Firestore
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(userCredential.user!.uid)
  //         .set({
  //       'username': _email.text.trim(),
  //       'role': "user",
  //     });
  //     getUserRole();
  //     checkUserRole();
  //   } catch (e) {
  //     print(
  //         "================================================================================error");
  //     print('Error registering user: $e');
  //   }
  // }

  // Future<String?> getUserRole() async {
  //   try {
  //     // Get the current user
  //     User? currentUser = FirebaseAuth.instance.currentUser;

  //     if (currentUser != null) {
  //       // Fetch user document from Firestore
  //       DocumentSnapshot userDoc = await FirebaseFirestore.instance
  //           .collection('users')
  //           .doc(currentUser.uid)
  //           .get();

  //       // Check if the role field exists
  //       if (userDoc.exists && userDoc['role'] != null) {
  //         return userDoc['role'] as String;
  //       }
  //     }
  //     return null; // Role not found
  //   } catch (e) {
  //     print('Error fetching user role: $e');
  //     return null;
  //   }
  // }

  // void checkUserRole() async {
  //   String? role = await getUserRole();

  //   if (role == 'admin') {
  //     print(
  //         "================================================================================answer");
  //     print('User is an admin');
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => Adminpage(),
  //     ));
  //   } else if (role == 'user') {
  //     print(
  //         "================================================================================answer");
  //     print('User is a regular user');
  //     Navigator.of(context).push(MaterialPageRoute(
  //       builder: (context) => Homepage(),
  //     ));
  //   } else {
  //     print(
  //         "================================================================================answer");
  //     print('Role not defined or user not found');
  //   }
  // }
  Future<void> registerUser() async {
    if (_password.text == _cpassword.text) {
      try {
        // Create user
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email.text.trim(),
          password: _password.text.trim(),
        );

        // Save user data in Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'username': _email.text.trim(),
          'role': "user",
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      } catch (e) {
        print(
            "================================================================================error");
        print('Error registering user: $e');
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('missmatch password'),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "REGISTER PAGE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 20, top: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 133, 131, 131),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _email,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 133, 131, 131),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _password,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 133, 131, 131),
              ),
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: _cpassword,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  labelText: "Cpassword",
                  labelStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 45, right: 40, top: 45),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 73, 49, 114),
              ),
              child: TextButton(
                  onPressed: () {
                    if (_password.text == _cpassword.text) {
                      registerUser();
                    } else {
                      print("incorrect");
                    }
                  },
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            // Container(
            //   child: TextButton(
            //       onPressed: () {},
            //       child:
            //           Text("Register", style: TextStyle(color: Colors.white))),
            // )
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Already have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Loginpage(),
                            ));
                      },
                      child: Text("login",
                          style: TextStyle(
                            color: Color.fromARGB(255, 73, 49, 114),
                          ))),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
