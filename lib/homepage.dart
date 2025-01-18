import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/exampage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List ls = ['java', 'python', 'flutter', 'mern'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Welcome Students",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  PopupMenuButton(
                    iconSize: 30,
                    iconColor: Colors.white,
                    itemBuilder: (context) {
                      return [''].map(
                        (String e) {
                          return PopupMenuItem<String>(
                              child: Column(
                            children: [
                              // TextButton(
                              //     onPressed: () {}, child: Text('Add Admin')),
                              TextButton(
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.popUntil(
                                      context,
                                      (route) => route.isFirst,
                                    );
                                  },
                                  child: Text('logout')),
                            ],
                          ));
                        },
                      ).toList();
                    },
                  )
                ],
              ),
              SizedBox(
                height: 140,
              ),
              Container(
                height: 630,
                width: double.infinity,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                padding: EdgeInsets.only(left: 10, right: 10),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Exampage(),
                                ));
                            Navigator.pushNamed(context, "exampage",
                                arguments: todosnapshot['language']
                                    .toString()
                                    .toUpperCase());
                            print('selected $index');
                          },
                          child: Container(
                            height: 70,
                            width: double.infinity,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 70, 69, 69),
                              borderRadius: BorderRadius.circular(20),
                            ),
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
            ],
          ),
        ));
  }
}
