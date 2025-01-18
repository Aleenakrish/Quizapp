import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Exampage extends StatefulWidget {
  const Exampage({super.key});

  @override
  State<Exampage> createState() => _ExampageState();
}

class _ExampageState extends State<Exampage> {
  String? topicname;

  List answers = [];

  int totalmark = 0;
  int total = 0;
  int outoff = 0;

  // final List<Map<String, dynamic>> _questions = [];
  List _questions = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
  ];

  // State to store selected answers and their correctness
  List _selectedAnswers = [];

  @override
  void initState() {
    super.initState();
    // fetchDataFromFirestore();
    _selectedAnswers = List<int?>.filled(
        _questions.length, null); // Initially, no answer is selected

    // _selectedAnswers = List<int?>.filled(.length, null); // Initially, no answer is selected

    //   _correctness = List<bool>.filled(_questions.length, false);   // Initially, all answers are marked incorrect
  }

  @override
  Widget build(BuildContext context) {
    topicname = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          // "Flutter",
          topicname.toString(),
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 22),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 45,
                    width: 95,
                    margin: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(75),
                    ),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () async {
                          print(_selectedAnswers);
                        },
                        child: Text(
                          'SUBMIT',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 15),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 600,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${topicname.toString()}')
                    .orderBy("question")
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot.data!.docs.length);

                  outoff = snapshot.data!.docs.length;

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot todosnapshot =
                          snapshot.data!.docs[index];

                      return Card(
                        color: const Color.fromARGB(255, 94, 93, 93),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}. ${todosnapshot['question']}',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              SizedBox(height: 12),
                              ...List.generate(todosnapshot['options'].length,
                                  (optionIndex) {
                                return ListTile(
                                  title: Text(
                                    todosnapshot['options'][optionIndex],
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  leading: Radio<int>(
                                    value: optionIndex,
                                    activeColor: Colors.green,
                                    groupValue: _selectedAnswers[index],
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedAnswers[index] = value;
                                        total = total + 1;
                                      });
                                    },
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
