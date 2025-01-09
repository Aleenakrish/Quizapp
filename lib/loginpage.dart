import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());

    print("/////////////////////////////////////////////////");

    print(_email);

    print(
        "////////////////////////////////////////////////////////////////////");
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 116, 114, 114),
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
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 116, 114, 114),
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
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 40, right: 40, top: 40),
              height: 55,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color.fromARGB(255, 116, 114, 114),
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
            Container(
              child: TextButton(
                  onPressed: () {},
                  child:
                      Text("Register", style: TextStyle(color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
