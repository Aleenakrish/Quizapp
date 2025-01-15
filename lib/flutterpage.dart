import 'package:flutter/material.dart';

class Flutterpage extends StatefulWidget {
  @override
  _FlutterpageState createState() => _FlutterpageState();
}

class _FlutterpageState extends State<Flutterpage> {
  // List of questions, each with four options
  List<Question> questions = [
    Question(
      questionText: ' What is Flutter??',
      options: [
        ' A web framework',
        'A cross-platform mobile application framework',
        'A native Android development framework',
        'A programming language'
      ],
      correctAnswer: 'A cross-platform mobile application framework',
    ),
    Question(
      questionText:
          ' Which Flutter widget allows you to create a scrollable list of items?',
      options: ['GridView', 'ListView', 'Column', 'Stack'],
      correctAnswer: 'ListView',
    ),
    Question(
      questionText:
          ' Which of the following is a widget in Flutter used for displaying text?',
      options: ['Container', 'Row', 'Column', 'Text'],
      correctAnswer: 'Text',
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
                        fontSize: 15,
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
                        activeColor: Colors.green,
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
