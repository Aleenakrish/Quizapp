import 'package:flutter/material.dart';

class Pythonpage extends StatefulWidget {
  @override
  _PythonpageState createState() => _PythonpageState();
}

class _PythonpageState extends State<Pythonpage> {
  // List of questions, each with four options
  List<Question> questions = [
    Question(
      questionText:
          '  "What is the output of the following code: print(2 ** 3)?",',
      options: ["4", "5", "6", "8"],
      correctAnswer: '8',
    ),
    Question(
      questionText: "Which function is used to get the length of a string in Python?",
      options: ["size()", "length()", "len()", "strlen()"],
      correctAnswer: 'len()',
    ),
    Question(
      questionText:
          ' Which of the following is a mutable data type?',
      options: [".py", ".java", ".txt", ".html"],
      correctAnswer: '.py',
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
