import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  Future register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(), password: _password.text.trim());
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
                "REGISTER PAGE",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 30, right: 30, top: 50),
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
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
              margin: EdgeInsets.only(left: 30, right: 30, top: 30),
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
                      register();
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
