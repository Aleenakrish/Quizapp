import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Additem extends StatefulWidget {
  const Additem({super.key});

  @override
  State<Additem> createState() => _AdditemState();
}

class _AdditemState extends State<Additem> {
  TextEditingController Question = TextEditingController();
  TextEditingController Option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();
  String? languagename;
  void add() async {
    List li = [Option1.text, option2.text, option3.text, option4.text];

    await FirebaseFirestore.instance
        .collection('${languagename}')
        .add({"question": Question.text, "options": li, "answer": answer.text});
  }

  @override
  Widget build(BuildContext context) {
    languagename = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.black,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Center(
              child: Text(
                languagename.toString(),
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Questions',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                CupertinoButton(
                  child: Text(
                    'save',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
            Container(
              height: 250,
              width: double.infinity,
              padding: EdgeInsets.only(left: 1.5, right: 1.5),
              decoration: BoxDecoration(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // SizedBox(height: 3,),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 73, 72, 72)),
                    width: double.infinity,
                    child: Expanded(
                        child: TextField(
                      cursorColor: Colors.white,
                      style: TextStyle(color: Colors.white),
                      controller: Question,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Question",
                          labelStyle: TextStyle(color: Colors.white)),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 73, 72, 72)),
                          child: Expanded(
                              child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: Option1,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.white)),
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 73, 72, 72)),
                          child: Expanded(
                              child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: option2,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.white)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 73, 72, 72)),
                          child: Expanded(
                              child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: option3,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.white)),
                          )),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 73, 72, 72)),
                          child: Expanded(
                              child: TextField(
                            cursorColor: Colors.white,
                            style: TextStyle(color: Colors.white),
                            controller: option4,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelStyle: TextStyle(color: Colors.white)),
                          )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 73, 72, 72)),
                        width: 150,
                        height: 50,
                        child: Expanded(
                            child: TextField(
                          controller: answer,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Answer",
                              hintStyle: TextStyle(color: Colors.white)),
                        )),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: const Color.fromARGB(255, 73, 72, 72)),
                        child: TextButton(
                            onPressed: () {
                              add();
                            },
                            child: Text(
                              "Add",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 450,
              width: double.infinity,
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('${languagename.toString()}')
                    .orderBy("question")
                    .snapshots(),
                builder: (context, snapshot) {
                  print(snapshot.data!.docs.length);
                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot todosnapshot =
                          snapshot.data!.docs[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${todosnapshot['question'].toString()}",
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              height: 100,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      width: 150,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][0]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                              child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][1]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      width: 150,
                                      child: Column(
                                        children: [
                                          Expanded(
                                              child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][2]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Expanded(
                                              child: Container(
                                            width: double.infinity,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.grey)),
                                            child: Text(
                                              todosnapshot["options"][3]
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 4,
                          ),
                          Container(
                            height: 40,
                            width: 93,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              'Answer: ${todosnapshot["answer"].toString()}',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
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
