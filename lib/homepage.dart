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
                  margin: EdgeInsets.only(left: 40, right: 40, top: 100),
                  height: 90,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 133, 131, 131),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        "FLUTTER",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 133, 131, 131),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        "PYTHON",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 133, 131, 131),
                  ),
                  child: TextButton(
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        "MERN",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, top: 40),
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color.fromARGB(255, 133, 131, 131),
                  ),
                  child: TextButton(
                      onPressed: () {},
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
