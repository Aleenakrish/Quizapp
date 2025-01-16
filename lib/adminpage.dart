

import 'package:flutter/material.dart';
import 'package:quizapp/addminadditems.dart';
import 'package:quizapp/adminaddnewitems.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});

  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  TextEditingController addnewfield = TextEditingController();
  List ls = ['flutter', 'python'];

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
                            color: Colors.grey.shade700,
                            size: 60,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
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
                                              padding:
                                                  EdgeInsets.only(top: 160),
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
            ]),
                    // PopupMenuButton(
                    //   itemBuilder: (context) {
                    //     return [''].map(
                    //       (String e) {
                    //         return PopupMenuItem<String>(
                    //             child: Column(
                    //           children: [
                    //             TextButton(
                    //                 onPressed: () {}, child: Text('Add',style: TextStyle(),)),
                    //             TextButton(
                    //                 onPressed: () {}, child: Text('logout')),
                    //           ],
                    //         ));
                    //       },
                    //     ).toList();
                    //   },
                    // )
                  
                ),
              
              // =======================================================================================================
              SizedBox(
                height: 15,
              ),
              Container(
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        height: 65,
                        width: double.infinity,
                        margin: EdgeInsets.only(right: 30, left: 30),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(20),
                            color: const Color.fromARGB(255, 65, 64, 64)),
                        child: TextButton(
                            style: TextButton.styleFrom(),
                            onPressed: () {
                              print('textbutton');
                            },
                            child: Text(
                              'Results',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminAddNewItem(),
                            ));
                      },
                      child: Container(
                        height: 65,
                        width: 65,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          weight: 25,
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
                child: ListView.builder(
                  itemCount: ls.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminAddItems(),
                            ));
                      },
                      child: Container(
                        height: 70,
                        // width: 200,
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15, left: 20, right: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 51, 51, 51),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          ls[index].toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ])));
  }
}















// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:quizapp/homepage.dart';
// import 'package:quizapp/flutterpage.dart';
// import 'package:quizapp/pythonpage.dart';

// class Adminpage extends StatefulWidget {
//   const Adminpage({super.key});

//   @override
//   State<Adminpage> createState() => _AdminpageState();
// }

// class _AdminpageState extends State<Adminpage> {
//   TextEditingController eml = TextEditingController();
//   Future restpswrd() async {
//     await FirebaseAuth.instance.sendPasswordResetEmail(email: eml.text.trim());
//   }

  
//   //////////////////////////////////////////////////////////////////////
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.black,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 20, top: 40),
//                     height: 70,
//                     width: 70,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(100),
//                         color: Colors.grey),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: 15),
//                     child: Text(
//                       "ADMIN",
//                       style: TextStyle(color: Colors.white, fontSize: 17),
//                     ),
//                   ),
//                 ],
//               ),
//               PopupMenuButton<String>(
//                 iconColor: Colors.white,
//                 iconSize: 33,
//                 color: Colors.white,
//                 onSelected: (String value) {
//                   print('Selected: $value');
//                 },
//                 itemBuilder: (BuildContext context) {
//                   return [""].map((String option) {
//                     return PopupMenuItem<String>(
//                         value: option,
//                         child: Column(
//                           children: [
//                             TextButton(
//                                 onPressed: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) {
//                                       return Scaffold(
//                                         backgroundColor: Colors.black,
//                                         appBar: AppBar(
//                                           iconTheme: IconThemeData(
//                                               color: Colors.white),
//                                           backgroundColor: Colors.black,
//                                         ),
//                                         body: ListView(
//                                           children: [
//                                             Container(
//                                               padding:
//                                                   EdgeInsets.only(top: 160),
//                                               child: Center(
//                                                 child: Text(
//                                                   "RESET PASSWORD",
//                                                   style: TextStyle(
//                                                       color: Colors.white,
//                                                       fontSize: 20),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               padding:
//                                                   EdgeInsets.only(left: 10),
//                                               margin: EdgeInsets.only(
//                                                   left: 30, right: 30, top: 50),
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 color: Color.fromARGB(
//                                                     255, 61, 60, 60),
//                                               ),
//                                               height: 60,
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               child: Container(
//                                                 child: TextField(
//                                                   controller: eml,
//                                                   cursorColor: Colors.white,
//                                                   decoration: InputDecoration(
//                                                     labelText: "Email",
//                                                     labelStyle: TextStyle(
//                                                         color: Colors.white),
//                                                     border: InputBorder.none,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                             Container(
//                                               margin: EdgeInsets.only(
//                                                   left: 40,
//                                                   right: 40,
//                                                   top: 100),
//                                               height: 55,
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                                 color: const Color.fromARGB(
//                                                     255, 73, 49, 114),
//                                               ),
//                                               child: TextButton(
//                                                   onPressed: () {
//                                                     restpswrd();
//                                                   },
//                                                   child: Text(
//                                                     "RESET",
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontWeight:
//                                                             FontWeight.bold),
//                                                   )),
//                                             ),
//                                           ],
//                                         ),
//                                       );
//                                     },
//                                   );
//                                 },
//                                 child: Text(
//                                   "Reset password",
//                                   style: TextStyle(color: Colors.black),
//                                 )),
//                             TextButton(
//                                 onPressed: () {},
//                                 child: Text(
//                                   "Logout",
//                                   style: TextStyle(color: Colors.black),
//                                 ))
//                           ],
//                         ));
//                   }).toList();
//                 },
//               )
//             ]),
//             Container(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.only(left: 10, top: 30),
//                     height: 60,
//                     width: 200,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Color.fromARGB(255, 61, 60, 60),
//                     ),
//                     child: TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, "resultpage");
//                         },
//                         child: Text(
//                           "Result",
//                           style: TextStyle(color: Colors.white, fontSize: 17),
//                         )),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(top: 20),
//                     child: IconButton(
//                         onPressed: () {
//                         },
//                         icon: Icon(
//                           Icons.add,
//                           color: Colors.white,
//                           size: 30,
//                         )),
//                   )
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
          

//             //////////////////////////////////////flutterqs//////////////////////////////////////////////////

//             Container(
//               height: 500,
//               width: MediaQuery.of(context).size.width,
//               child: ListView(
//                 children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, "flutterpage");
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Color.fromARGB(255, 61, 60, 60),
//                 ),
//                 margin: EdgeInsets.only(left: 30, right: 30, top: 15),
//                 height: 80,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Text(
//                     "FLUTTER",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17),
//                   ),
//                 ),
//               ),
//             ),
//                   //////////////////////////////////////flutterqs.end//////////////////////////////////////////////////

//                   ////////////////////////////////////////python//////////////////////////////////////////////////
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, "pythonpage");
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Color.fromARGB(255, 61, 60, 60),
//                 ),
//                 margin: EdgeInsets.only(left: 30, right: 30, top: 15),
//                 height: 80,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Text(
//                     "PYTHON",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17),
//                   ),
//                 ),
//               ),
//             ),
//                   ////////////////////////////////////////python.end//////////////////////////////////////////////////
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.pushNamed(context, "mernpage");
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(15),
//                         color: Color.fromARGB(255, 61, 60, 60),
//                       ),
//                       margin: EdgeInsets.only(left: 30, right: 30, top: 15),
//                       height: 80,
//                       width: MediaQuery.of(context).size.width,
//                       child: Center(
//                         child: Text(
//                           "MERN",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 17),
//                         ),
//                       ),
//                     ),
//                   ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushNamed(context, "javapage");
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15),
//                   color: Color.fromARGB(255, 61, 60, 60),
//                 ),
//                 margin: EdgeInsets.only(left: 30, right: 30, top: 15),
//                 height: 80,
//                 width: MediaQuery.of(context).size.width,
//                 child: Center(
//                   child: Text(
//                     "JAVA SCRIPT",
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 17),
//                   ),
//                 ),
//               ),
//             )
//             ]

//               ),
//             ),
//           ],
//         ));
//   }
// }
