import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:login/handicape/custombar.dart';

class Infoexam extends StatefulWidget {
  const Infoexam({Key? key}) : super(key: key);

  @override
  State<Infoexam> createState() => _InfoexamState();
}

class _InfoexamState extends State<Infoexam> {


  @override
  int _value = 0;

  String selectedValue= "MCQ";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems1 = [
      DropdownMenuItem(child: Text("MCQ"), value: "MCQ"),
      DropdownMenuItem(child: Text("Writen"), value: "Writen"),
      DropdownMenuItem(
          child: Text("Computer Exam McQ"), value: "Computer Exam McQ"),

    ];
    return menuItems1;
  }






  Widget build(BuildContext context) {
    TextEditingController _examsuject = TextEditingController();
    TextEditingController _Examtime = TextEditingController();
    TextEditingController _examlocation = TextEditingController();
    TextEditingController _examcity = TextEditingController();
    Future<void> addData() {
      CollectionReference users = FirebaseFirestore.instance.collection("Exam")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("DetailsOfWriter");
      return users.doc()
          .set({
        "Examtime": _Examtime.text.toString(),
        "Examlocation": _examlocation.text.toString(),
        "Examcity": _examcity.text.toString(),
        "Suject": _examsuject.text.toString()
        ,
      })
          .then((value) => print("data Added"))
          .catchError((error) => print("Failed to add data: $error"));
    }

    // var items1 = [
    //   "Science",
    //   "commerce",
    //   "Arts",
    //   "Diploma",
    //   "other",
    // ];
    // String dropdownvalue2 = 'MCQ';
    // var items2 = [
    //   "MCQ",
    //   "Computer Exam MCQ",
    //   "Written"
    // ];

    void _showdatepicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
    }
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    // Widget minRnt() {
    //   return Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(width: 3, color: Color(0xffE69023)),
    //       borderRadius: BorderRadius.all(
    //           Radius.circular(MediaQuery.of(context).size.height * 0.019)),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //           left: MediaQuery.of(context).size.height * 0.008,
    //           right: MediaQuery.of(context).size.height * 0.008),
    //       child: DropdownButtonHideUnderline(
    //         child: DropdownButtonFormField(
    //           decoration: InputDecoration(
    //               focusedBorder: InputBorder.none,
    //               enabledBorder: InputBorder.none),
    //           borderRadius: BorderRadius.circular(
    //               MediaQuery.of(context).size.height * 0.010),
    //           menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
    //           // Initial Value
    //           value: dropdownvalue1,
    //
    //           // Down Arrow Icon
    //           icon: const Icon(Icons.keyboard_arrow_down),
    //           isExpanded: true,
    //           // Array list of items
    //           items: items1.map((String items) {
    //             return DropdownMenuItem(
    //               value: items,
    //               child: Text(items),
    //             );
    //           }).toList(),
    //           // After selecting the desired option,it will
    //           // change button value to selected value
    //           onChanged: (String? newValue) {
    //             setState(() {
    //               dropdownvalue1 = newValue!;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    // }
    // Widget minRnt1() {
    //   return Container(
    //     decoration: BoxDecoration(
    //       border: Border.all(width: 3, color: Color(0xffE69023)),
    //       borderRadius: BorderRadius.all(
    //           Radius.circular(MediaQuery.of(context).size.height * 0.019)),
    //     ),
    //     child: Padding(
    //       padding: EdgeInsets.only(
    //           left: MediaQuery.of(context).size.height * 0.008,
    //           right: MediaQuery.of(context).size.height * 0.008),
    //       child: DropdownButtonHideUnderline(
    //         child: DropdownButtonFormField(
    //           decoration: InputDecoration(
    //               focusedBorder: InputBorder.none,
    //               enabledBorder: InputBorder.none),
    //           borderRadius: BorderRadius.circular(
    //               MediaQuery.of(context).size.height * 0.010),
    //           menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
    //           // Initial Value
    //           value: dropdownvalue2,
    //
    //           // Down Arrow Icon
    //           icon: const Icon(Icons.keyboard_arrow_down),
    //           isExpanded: true,
    //           // Array list of items
    //           items: items2.map((String items) {
    //             return DropdownMenuItem(
    //               value: items,
    //               child: Text(items),
    //             );
    //           }).toList(),
    //           // After selecting the desired option,it will
    //           // change button value to selected value
    //           onChanged: (String? newValue) {
    //             setState(() {
    //               dropdownvalue2 = newValue!;
    //             });
    //           },
    //         ),
    //       ),
    //     ),
    //   );
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Select Your Stream", style: TextStyle(
                    color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),


                SizedBox(height: height * .02,),
                Text("Enter Your Exam Subject", style: TextStyle(
                    color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),

                TextField(
                    controller: _examsuject,
                    decoration: InputDecoration(
                      hintText: "Enter Subject here",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                    )),
                SizedBox(height: height * .02,),
                Text("Birth Date",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3C3939),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: height * .01,
                ),
                InkWell(
                  onTap: _showdatepicker,

                  child: Text("date",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent)),
                ),
                SizedBox(height: height * .02,),
                Text("Exam Time", style: TextStyle(color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),

                TextField(
                    controller: _Examtime,
                    decoration: InputDecoration(
                      hintText: "Select Time",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                    )),

                SizedBox(height: height * .02,),
                Text("Exam Location", style: TextStyle(color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),

                TextField(
                    controller: _examlocation,
                    decoration: InputDecoration(
                      hintText: "Select Exam Location",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                    )),
                SizedBox(height: height * .02,),
                Text("Exam City", style: TextStyle(color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),

                TextField(
                    controller: _examcity,
                    decoration: InputDecoration(
                      hintText: "Select Exam City",
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffE69023),
                            width: 3,
                          ),
                          borderRadius:
                          BorderRadius.circular(15)),
                    )),
                SizedBox(height: height * .02,),
                Text("Exam Type", style: TextStyle(color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),

                DropdownButtonFormField(
                    decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            color: Color(0xffE69023), width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder( //<-- SEE HERE
                        borderSide: BorderSide(
                            color: Color(0xffE69023), width: 3),
                        borderRadius: BorderRadius.circular(15),
                      ),


                      fillColor: Colors.white,
                    ),
                    dropdownColor: Colors.white,
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                      });
                    },
                    items: dropdownItems),


                SizedBox(height: height * .02,),
                Text("Exam Level", style: TextStyle(color: Color(0xff3C3939),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),),
                SizedBox(height: height * .01,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .05,

                      child: Row(
                        children: [
                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _value = 0;
                                }),
                            child: Container(
                              height: height * .1,
                              width: width * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _value == 0
                                      ? Color(0xffE69023)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xffE69023), width: 2)
                              ),
                              alignment: Alignment.center,
                              child: Text("Std X", style: TextStyle(
                                  color: Color(0xff3C3939),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                            ),
                          ),
                          SizedBox(width: width * .039,),
                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _value = 1;
                                }),
                            child: Container(
                              height: height * .1,
                              width: width * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _value == 1
                                      ? Color(0xffE69023)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xffE69023), width: 2)
                              ),
                              alignment: Alignment.center,
                              child: Text("Std XII", style: TextStyle(
                                  color: Color(0xff3C3939),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                            ),
                          ),
                          SizedBox(width: width * .039,),
                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _value = 2;
                                }),
                            child: Container(
                              height: height * .1,
                              width: width * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _value == 2
                                      ? Color(0xffE69023)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xffE69023), width: 2)
                              ),
                              alignment: Alignment.center,
                              child: Text("Graduate", style: TextStyle(
                                  color: Color(0xff3C3939),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                            ),
                          ),


                        ],
                      ),
                    ),


                  ],
                ),
                SizedBox(height: height * .02,),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: height * .05,

                      child: Row(
                        children: [


                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _value = 3;
                                }),
                            child: Container(
                              height: height * .1,
                              width: width * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _value == 3
                                      ? Color(0xffE69023)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xffE69023), width: 2)
                              ),
                              alignment: Alignment.center,
                              child: Text("P.Graguate", style: TextStyle(
                                  color: Color(0xff3C3939),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                            ),
                          ),
                          SizedBox(width: width * .039,),
                          InkWell(
                            onTap: () =>
                                setState(() {
                                  _value = 4;
                                }),
                            child: Container(
                              height: height * .1,
                              width: width * .25,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _value == 4
                                      ? Color(0xffE69023)
                                      : Colors.white,
                                  border: Border.all(
                                      color: Color(0xffE69023), width: 2)
                              ),
                              alignment: Alignment.center,
                              child: Text("Below Std.X", style: TextStyle(
                                  color: Color(0xff3C3939),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none)),
                            ),
                          ),


                        ],
                      ),
                    ),


                  ],
                ),
                SizedBox(height: height * .05,),

                Center(
                  child: GestureDetector(
                    onTap: () {
                      // addData();
                      // Navigator.push(context,MaterialPageRoute(builder: (context) => Custombar()));
                    },
                    child: Container(
                      height: height * .08,
                      width: width * .4,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff2B5871),
                      ),
                      child: Text(
                        "Exam Post", style: TextStyle(color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w600),

                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * .05,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}