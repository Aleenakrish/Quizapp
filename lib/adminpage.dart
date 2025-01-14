import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  TextEditingController eml = TextEditingController();
  Future restpswrd() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: eml.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, top: 40),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      "ADMIN",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ),
                ],
              ),
              PopupMenuButton<String>(
                iconColor: Colors.white,
                iconSize: 33,
                color: Colors.white,
                onSelected: (String value) {
                  print('Selected: $value');
                },
                itemBuilder: (BuildContext context) {
                  return [""].map((String option) {
                    return PopupMenuItem<String>(
                        value: option,
                        child: Column(
                          children: [
                            TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Scaffold(
                                        backgroundColor: Colors.black,
                                        appBar: AppBar(
                                          iconTheme: IconThemeData(
                                              color: Colors.white),
                                          backgroundColor: Colors.black,
                                        ),
                                        body: ListView(
                                          children: [
                                            Container(
                                              padding:
                                                  EdgeInsets.only(top: 160),
                                              child: Center(
                                                child: Text(
                                                  "RESET PASSWORD",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              margin: EdgeInsets.only(
                                                  left: 30, right: 30, top: 50),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Color.fromARGB(
                                                    255, 133, 131, 131),
                                              ),
                                              height: 60,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Container(
                                                child: TextField(
                                                  controller: eml,
                                                  cursorColor: Colors.white,
                                                  decoration: InputDecoration(
                                                    labelText: "Email",
                                                    labelStyle: TextStyle(
                                                        color: Colors.white),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 40,
                                                  right: 40,
                                                  top: 100),
                                              height: 55,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: const Color.fromARGB(
                                                    255, 73, 49, 114),
                                              ),
                                              child: TextButton(
                                                  onPressed: () {
                                                    restpswrd();
                                                  },
                                                  child: Text(
                                                    "RESET",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Text(
                                  "Reset password",
                                  style: TextStyle(color: Colors.black),
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.black),
                                ))
                          ],
                        ));
                  }).toList();
                },
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, top: 30),
                  height: 60,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 133, 131, 131),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Result",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      )),
                )
              ],
            )
          ],
        ));
  }
}
