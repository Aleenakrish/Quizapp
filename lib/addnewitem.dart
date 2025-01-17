import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Addnewitem extends StatefulWidget {
  const Addnewitem({super.key});

  @override
  State<Addnewitem> createState() => _AddnewitemState();
}

class _AddnewitemState extends State<Addnewitem> {
  @override
  TextEditingController Topic = TextEditingController();
  TextEditingController Question = TextEditingController();
  TextEditingController Option1 = TextEditingController();
  TextEditingController option2 = TextEditingController();
  TextEditingController option3 = TextEditingController();
  TextEditingController option4 = TextEditingController();
  TextEditingController answer = TextEditingController();
  List ls = [
    {
      "question": "",
      "options": ["one", "two", "three", "four"],
      "answer": "1"
    }
  ]; //fontweight
  Map mp = {};

  void addtoList() async {
    List li = [Option1.text, option2.text, option3.text, option4.text];
    mp = {"question": Question.text, "options": li, "answer": answer.text};
    setState(() {
      ls.add(mp);
    });
    try {
      await FirebaseFirestore.instance.collection('${Topic.text}').add(
          {"question": Question.text, "options": li, "answer": answer.text});
    } catch (e) {
      print(e);
    }
    Question.clear();
    Option1.clear();
    option2.clear();
    option3.clear();
    option4.clear();
    answer.clear();
  }

  void getdatas() async {}

  Widget build(BuildContext context) {
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
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Add Topic',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                IconButton(
                    onPressed: () async {
                      if (Topic.text != '') {
                        try {
                          await FirebaseFirestore.instance
                              .collection('topics')
                              .add({"language": Topic.text});
                          Navigator.pop(context);
                        } catch (e) {
                          print(e);
                        }
                      } else {
                        print(Topic);
                        // showDialog(
                        //   context: context,
                        //   builder: (context) {
                        //     return AlertDialog(
                        //       content: Text("enter a topic"),
                        //       actions: [
                        //         TextButton(
                        //             onPressed: () {
                        //               Navigator.pop(context);
                        //             },
                        //             child: Text("ok"))
                        //       ],
                        //     );
                        //   },
                        // );
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 73, 72, 72),
                  borderRadius: BorderRadius.circular(10)),
              child: Expanded(
                  child: TextField(
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                controller: Topic,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Enter Topic",
                    labelStyle: TextStyle(color: Colors.white)),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 270,
              width: double.infinity,
              padding: EdgeInsets.only(left: 1.5, right: 1.5),
              decoration: BoxDecoration(border: Border.all()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 73, 72, 72),
                    ),
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
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
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
                              borderRadius: BorderRadius.circular(20),
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
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          height: 55,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 73, 72, 72)),
                          child: Expanded(
                              child: TextField(
                            cursorColor: Colors.white,
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
                              borderRadius: BorderRadius.circular(20),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10),
                        width: 100,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 73, 72, 72),
                        ),
                        child: Expanded(
                            child: TextField(
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          controller: answer,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Answer",
                              labelStyle: TextStyle(color: Colors.white)),
                        )),
                      ),
                      TextButton(
                          onPressed: () {
                            addtoList();
                          },
                          child: Text(
                            "Add",
                            style: TextStyle(color: Colors.white),
                          )),
                      // CupertinoButton(
                      //   sizeStyle: CupertinoButtonSize.small,
                      //   color: Colors.blue,
                      //   borderRadius: BorderRadius.circular(5),
                      //   child: Text(
                      //     'Add',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      //   onPressed: () {
                      //     addtoList();
                      //   },
                      // ),
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
            Container(
              height: 550,
              width: double.infinity,
              child: Topic.text.isNotEmpty
                  ? StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('${Topic.text}')
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
                                  // "2). who developed flutter?",
                                  "${index + 1}). ${todosnapshot["question"].toString()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
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
                                                          .toString()),
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
                                                          .toString()),
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
                                                          .toString()),
                                                ))
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )),
                              ],
                            );
                          },
                        );
                      },
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
