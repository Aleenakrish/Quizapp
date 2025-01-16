import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 170),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 53, 52, 52),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "flutterpage");
                      },
                      child: Center(
                          child: Text(
                        "FLUTTER",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 53, 52, 52),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "pythonpage");
                      },
                      child: Center(
                          child: Text(
                        "PYTHON",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 53, 52, 52),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "mernpage");
                      },
                      child: Center(
                          child: Text(
                        "MERN",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 15),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 53, 52, 52),
                  ),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "javapage");
                      },
                      child: Center(
                          child: Text(
                        "JAVA SCRIPT",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
