import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/adminpage.dart';
import 'package:quizapp/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController eml = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future<void> registerUser() async {
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
      getUserRole();
      checkUserRole();
    } catch (e) {
      print(
          "================================================================================error");
      print('Error registering user: $e');
    }
  }

  Future<String?> getUserRole() async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Fetch user document from Firestore
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();

        // Check if the role field exists
        if (userDoc.exists && userDoc['role'] != null) {
          return userDoc['role'] as String;
        }
      }
      return null; // Role not found
    } catch (e) {
      print('Error fetching user role: $e');
      return null;
    }
  }

  void checkUserRole() async {
    String? role = await getUserRole();

    if (role == 'admin') {
      print(
          "================================================================================answer");
      print('User is an admin');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Adminpage(),
      ));
    } else if (role == 'user') {
      print(
          "================================================================================answer");
      print('User is a regular user');
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Homepage(),
      ));
    } else {
      print(
          "================================================================================answer");
      print('Role not defined or user not found');
    }
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email.text.trim(), password: _password.text.trim());

      checkUserRole();
    } catch (e) {
      print(
          "================================================================================error");
      print(e);
    }
  }

  // Future login() async {
  //   // try {
  //   //   final email = _email.text.trim();
  //   //   final password = _password.text.trim();

  //   //   UserCredential userCredential =
  //   //       await FirebaseAuth.instance.signInWithEmailAndPassword(
  //   //     email: email,
  //   //     password: password,
  //   //   );
  //   //   Navigator.pushReplacement(
  //   //     context,
  //   //     MaterialPageRoute(builder: (context) => Homepage()),
  //   //   );
  //   // } on FirebaseAuthException catch (e) {
  //   //   print("Login failed: ${e.message}");
  //   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: ${e.message}')));
  //   // }
  //   await FirebaseAuth.instance.signInWithEmailAndPassword(
  //       email: _email.text.trim(), password: _password.text.trim());
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(builder: (context) => Homepage()),
  //   );
  // }

  Future resetpaswrd() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: eml.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                "LOGIN PAGE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 70),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 133, 131, 131),
              ),
              height: 63,
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
              height: 63,
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
            ///////////////////////////////////////////////////////////resetpassword'////////////////////////////////////////////////////
            Container(
              margin: EdgeInsets.only(left: 140),
              child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Scaffold(
                          backgroundColor: Colors.black,
                          appBar: AppBar(
                            iconTheme: IconThemeData(color: Colors.white),
                            backgroundColor: Colors.black,
                          ),
                          body: ListView(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 160),
                                child: Center(
                                  child: Text(
                                    "RESET PASSWORD",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                margin: EdgeInsets.only(
                                    left: 30, right: 30, top: 50),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color.fromARGB(255, 133, 131, 131),
                                ),
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Container(
                                  child: TextField(
                                    controller: eml,
                                    cursorColor: Colors.white,
                                    decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle:
                                          TextStyle(color: Colors.white),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 40, right: 40, top: 100),
                                height: 55,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromARGB(255, 73, 49, 114),
                                ),
                                child: TextButton(
                                    onPressed: () {
                                      resetpaswrd();
                                    },
                                    child: Text(
                                      "RESET",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    "Forgot password",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 73, 49, 114),
                    ),
                  )),
            ),

            ///////////////////////////////////////////////////////////resetpassword'////////////////////////////////////////////////////
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 30),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 73, 49, 114),
              ),
              child: TextButton(
                  onPressed: () {
                    login();
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    "Dont have an account?",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "registerpage");
                      },
                      child: Text("Register",
                          style: TextStyle(
                            color: Color.fromARGB(255, 73, 49, 114),
                          ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
