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
              height: 20,
            ),
            Container(
              // color: Colors.amber,
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
                                Container(
                                  child: Text(
                                    // "2). who developed flutter?",
                                    ////${index }).  "${todosnapshot["question"].toString()}",
                                    " ${index}).${todosnapshot["question"].toString()}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
                                  ),
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
