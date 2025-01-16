import 'package:flutter/material.dart';

class Resultpage extends StatefulWidget {
  const Resultpage({super.key});

  @override
  State<Resultpage> createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: ListView(
          children: [Container()],
        ),
      ),
    );
  }
}
