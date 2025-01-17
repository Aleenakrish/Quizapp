import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:quizapp/addnewitem.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  TextEditingController addnewfield = TextEditingController();
  // List ls = ['flutter', 'python'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.all(15),
            child: ListView(children: [
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.grey.shade200),
                          child: Icon(
                            Icons.person,
                            color: const Color.fromARGB(255, 73, 72, 72),
                            size: 60,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "ADMIN",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 17,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    // ====================================
                    PopupMenuButton<String>(
                      iconColor: Colors.white,
                      iconSize: 33,
                      color: Colors.white,
                      onSelected: (String value) {
                        print('Selected: $value');
                      },
                      itemBuilder: (BuildContext context) {
                        return [""].map((String option) {
                          return PopupMenuItem<String>(
                              value: option,
                              child: Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Scaffold(
                                              backgroundColor: Colors.black,
                                              appBar: AppBar(
                                                iconTheme: IconThemeData(
                                                    color: Colors.white),
                                                backgroundColor: Colors.black,
                                              ),
                                              body: ListView(
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 160),
                                                    child: Center(
                                                      child: Text(
                                                        "RESET PASSWORD",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 20),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Text(
                                        "Reset password",
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(color: Colors.black),
                                      ))
                                ],
                              ));
                        }).toList();
                      },
                    )
                  ],
                ),
              ),
              // =======================================================================================================
              SizedBox(
                height: 15,
              ),
              Container(
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 30, left: 20),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 73, 72, 72)),
                        child: TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent),
                            onPressed: () {},
                            child: Text(
                              'Results',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Addnewitem(),
                            ));
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // +++==================================================================================================
              Container(
                height: 550,
                width: double.infinity,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('topics')
                      .orderBy("language")
                      .snapshots(),
                  builder: (context, snapshot) {
                    print(snapshot.data!.docs.length);
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot todosnapshot =
                            snapshot.data!.docs[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "additem",
                                arguments: todosnapshot['language']
                                    .toString()
                                    .toUpperCase());
                          },
                          child: Container(
                            height: 75,
                            width: double.infinity,
                            margin:
                                EdgeInsets.only(top: 15, left: 20, right: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 73, 72, 72)),
                            alignment: Alignment.center,
                            child: Text(
                              todosnapshot['language'].toString().toUpperCase(),
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ])));
  }
}
