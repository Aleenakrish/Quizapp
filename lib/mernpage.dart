import 'package:flutter/material.dart';

class Mernpage extends StatefulWidget {
  @override
  _MernpageState createState() => _MernpageState();
}

class _MernpageState extends State<Mernpage> {
  // List of questions, each with four options
  List<Question> questions = [
    Question(
      questionText: "What does 'M' in MERN stack stand for?",
      options: ["MySQL", "MongoDB", "MariaDB", "Microsoft SQL Server"],
      correctAnswer: 'MongoDB',
    ),
    Question(
      questionText: "Which JavaScript framework is used in the 'E' of MERN?",
      options: ["Express.js", "Ember.js", "Electron", "Ext JS"],
      correctAnswer: "Express.js",
    ),
    Question(
      questionText:
          "Which library is used for building the user interface in MERN?",
      options: ["jQuery", "React", "Vue", "Angular"],
      correctAnswer: "React",
    ),
  ];

  Map<int, String?> selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
                size: 29,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          Question question = questions[index];

          return Card(
            color: Color.fromARGB(255, 53, 52, 52),
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question.questionText,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  ...question.options.map((option) {
                    return Container(
                      child: RadioListTile<String>(
                        title: Text(
                          option,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        value: option,
                        groupValue: selectedAnswers[index],
                        onChanged: (value) {
                          setState(() {
                            selectedAnswers[index] = value;
                          });
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Question {
  String questionText;
  List<String> options;
  String correctAnswer;

  Question({
    required this.questionText,
    required this.options,
    required this.correctAnswer,
  });
}
