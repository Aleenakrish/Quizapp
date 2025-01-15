import 'package:flutter/material.dart';

class Javapage extends StatefulWidget {
  @override
  _JavapageState createState() => _JavapageState();
}

class _JavapageState extends State<Javapage> {
  // List of questions, each with four options
  List<Question> questions = [
    Question(
      questionText:
          "Which of the following is used to declare a variable in JavaScript?",
      options: ["var", "let", "const", "All of the above"],
      correctAnswer: "All of the above",
    ),
    Question(
      questionText:
          "Which method is used to parse a JSON string into an object in JavaScript?",
      options: [
        "JSON.parse()",
        "JSON.stringify()",
        "JSON.toObject()",
        "JSON.decode()"
      ],
      correctAnswer: 'JSON.parse()',
    ),
    Question(
      questionText:
          "What will be the output of the following code: console.log(2 + '2')?",
      options: ["String", "Number", "Boolean", "Character"],
      correctAnswer: '"Character"',
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
