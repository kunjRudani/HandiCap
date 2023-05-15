import 'dart:io';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/collection/custombar1.dart';
import 'package:login/handicape/custombar.dart';



class Education extends StatefulWidget {

  final String gender;
  final String name;
  final String number;
  final String  andhar;
  final String address;
  final String image;
  final String city;
  final String state;
  final String pincode;
  final String disability;


  Education({required this.gender, required this.name, required this.number, required this.andhar, required this.address, required this.city, required this.state, required this.pincode, required this.disability, required this.image,});


  @override
  State<Education> createState() => _WirteinfoState();
}

class _WirteinfoState extends State<Education> {

  String imageUrl1="";
  @override
  TextEditingController _standardXschool=TextEditingController();
  TextEditingController _standardXpercentage=TextEditingController();
  TextEditingController _standardXPasssingYear=TextEditingController();
  TextEditingController _standardXBoard=TextEditingController();
  TextEditingController _standardX11school=TextEditingController();
  TextEditingController _standardX11percentage=TextEditingController();
  TextEditingController _standardX11PasssingYear=TextEditingController();
  TextEditingController _standardX11Board=TextEditingController();
  TextEditingController _standardcollage=TextEditingController();
  TextEditingController _standardCpercentage=TextEditingController();
  TextEditingController _standardCPasssingYear=TextEditingController();
  TextEditingController _standardMaster=TextEditingController();
  TextEditingController _standardMpercentage=TextEditingController();
  TextEditingController _standardMPasssingYear=TextEditingController();
  TextEditingController _standard1to1Xschool=TextEditingController();
  TextEditingController _standard1toXpercentage=TextEditingController();
  TextEditingController _standard1toXPasssingYear=TextEditingController();

  Future<void> addData() {
    CollectionReference users = FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser?.email).collection("HandicapeOfWriter");
    return users.doc()
        .set({
      "name":widget.name,
      "number": widget.number,
      "adharcard ": widget.andhar,
      "gender": widget.gender,
      "address": widget.address,
      "city": widget.city,
      "state":widget.state,
      "DescibeYourDisablilty":widget.disability,
      "image":widget.image,
      "imageofboardpaper":imageUrl1,
      "School name of X":_standardXschool.text.toString(),
      "School Boardof X":_standardXBoard.text.toString(),
      "School Percentage of X":_standardXpercentage.text.toString(),
      "School Passing year  of X":_standardXPasssingYear.text.toString(),
      "School name of X11":_standardX11school.text.toString(),
      "School board of X11":_standardX11Board.text.toString(),
      "School Percentage of X11":_standardX11percentage.text.toString(),
      "School Passing year of X11":_standardX11PasssingYear.text.toString(),
      "Collage name ":_standardcollage.text.toString(),
      "Collage Percentage" :_standardCpercentage.text.toString(),
      "Collage Passing year ":_standardCPasssingYear.text.toString(),
      "Master name ":_standardMaster.text.toString(),
      "Master Percentage ":_standardMpercentage.text.toString(),
      "Master Passing year":_standardMPasssingYear.text.toString(),

    })
        .then((value) => print("data Added"))
        .catchError((error) => print("Failed to add data: $error"));
  }
  Future<void> addData1() {
    CollectionReference users = FirebaseFirestore.instance.collection("HandicapeOfWriter");
    return users.doc()
        .set({
      "name":widget.name,
      "number": widget.number,
      "adharcard ": widget.andhar,
      "gender": widget.gender,
      "image":widget.image,
      "address": widget.address,
      "city": widget.city,
      "state":widget.state,
      "imageofboardpaper":imageUrl1,
      "DescibeYourDisablilty":widget.disability,
      "School name of X":_standardXschool.text.toString(),
      "School Boardof X":_standardXBoard.text.toString(),
      "School Percentage of X":_standardXpercentage.text.toString(),
      "School Passing year  of X":_standardXPasssingYear.text.toString(),
      "School name of X11":_standardX11school.text.toString(),
      "School board of X11":_standardX11Board.text.toString(),
      "School Percentage of X11":_standardX11percentage.text.toString(),
      "School Passing year of X11":_standardX11PasssingYear.text.toString(),
      "Collage name ":_standardcollage.text.toString(),
      "Collage Percentage" :_standardCpercentage.text.toString(),
      "Collage Passing year ":_standardCPasssingYear.text.toString(),
      "Master name ":_standardMaster.text.toString(),
      "Master Percentage ":_standardMpercentage.text.toString(),
      "Master Passing year":_standardMPasssingYear.text.toString()
      ,
    })
        .then((value) => print("data Added"))
        .catchError((error) => print("Failed to add data: $error"));
  }


  String dropdownvalue1 = 'Science';
  var items1 = [
    "Science",
    "commerce",
    "Arts",
    "Diploma",
    "other",
  ];
  bool _isShow = false;
  bool _isShow1 = false;
  bool _isShow2 = false;
  bool _isShow3 = false;
  bool _isShow4 = false;
  bool _isShow5 = false;

  Widget minRnt() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Color(0xffE69023)),
        borderRadius: BorderRadius.all(
            Radius.circular(MediaQuery.of(context).size.height * 0.019)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.height * 0.008,
            right: MediaQuery.of(context).size.height * 0.008),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField(
            decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.010),
            menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
            // Initial Value
            value: dropdownvalue1,

            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            isExpanded: true,
            // Array list of items
            items: items1.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue1 = newValue!;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    void _showdatepicker() {
      showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025));
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar:                       Container(
        color: Colors.black,
        height: height * .07,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:  EdgeInsets.only(left: height*.02,top: height*.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please Enter Your Details ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: height * .02,
                          fontWeight: FontWeight.w600),
                    ),
                    Text("correct & carefully",  style: TextStyle(
                        color: Colors.white,
                        fontSize: height * .02,
                        fontWeight: FontWeight.w600),)
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xffE69023),
                ),

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        addData1();
                        addData();
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Custombar(),));
                      },
                      child: Text("Next",style: TextStyle(
                          color: Colors.white,
                          fontSize: height*.02,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      )
      ,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff21222D),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: height * 0.02),
                  child: Center(
                      child: Text(
                        "Netflix",
                        style: TextStyle(
                            fontSize: 45,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      )),
                ),
                SizedBox(
                  height: height * .03,
                ),
                Text(
                  "Enter Education details to ",
                  style:
                  TextStyle(fontSize: height * .035, color: Colors.white),
                ),
                Text(
                  "get started",
                  style:
                  TextStyle(fontSize: height * .035, color: Colors.white),
                ),
                SizedBox(
                  height: height * .026,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                    Container(
                      height: height * .003,
                      width: width * .25,
                      color: Colors.white,
                      child: Row(),
                    ),
                    Icon(
                      Icons.circle,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Container(
                  height: height *.662,

                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50)),
                      color: Colors.white),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * .001,
                              ),
                              Text(
                                "Select Your Stream",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              minRnt(),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: height * .08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xffE69023), width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter standard X details",
                                        style:
                                        TextStyle(fontSize: height * .02),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              _isShow = !_isShow;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _isShow,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standardXschool,
                                          decoration: InputDecoration(
                                            hintText: "School Name",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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
                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      TextField(
                                          controller: _standardXBoard,
                                          decoration: InputDecoration(
                                            hintText: "Enter Education Board",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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
                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      Container(
                                        height: height * .08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2B5871), width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Image of Sheet",
                                                style:
                                                TextStyle(fontSize: height * .02),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(
                                                        () {
                                                      _isShow1 = !_isShow1;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline_sharp,
                                                  size: 20,
                                                ),
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: _isShow1,
                                        child: IconButton(

                                          onPressed: () async{
                                            ImagePicker imagepicker =ImagePicker();
                                            XFile? file= await imagepicker.pickImage(source: ImageSource.gallery);
                                            print("${file?.path}");
                                            if(file==null) return;
                                            String unqiueFileName=DateTime.now().millisecondsSinceEpoch.toString();

                                            Reference referenceRoot=FirebaseStorage.instance.ref();
                                            Reference referenceDirImage=referenceRoot.child("images");
                                            Reference referenceImageTouplode=referenceDirImage.child(unqiueFileName);
                                            try{
                                              await  referenceImageTouplode.putFile(File(file!.path));
                                              imageUrl1=await referenceImageTouplode.getDownloadURL();

                                            }catch(error){}

                                          }, icon: Icon(Icons.camera_alt_rounded),),)

                                      ,SizedBox(height: height*.02,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height *.08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardXpercentage,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Percentage",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardXPasssingYear,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Passing year",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )),
                              SizedBox(height: height*.02,),
                              Container(
                                height: height * .08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xffE69023), width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter standard XII details",
                                        style:
                                        TextStyle(fontSize: height * .02),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              _isShow2 = !_isShow2;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _isShow2,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standardX11school,
                                          decoration: InputDecoration(
                                            hintText: "Enter School Name",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standardX11Board,
                                          decoration: InputDecoration(
                                            hintText: " Enter Education Board",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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
                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      Container(
                                        height: height * .08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2B5871), width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Image of Sheet",
                                                style:
                                                TextStyle(fontSize: height * .02),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(
                                                        () {
                                                      _isShow1 = !_isShow1;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline_sharp,
                                                  size: 20,
                                                ),
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: _isShow1,
                                          child: Text("data"))
                                      ,SizedBox(height: height*.02,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardX11percentage,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Percentage",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardX11PasssingYear,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Passing year",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )),
                              SizedBox(height: height*.02,),
                              Container(
                                height: height * .08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xffE69023), width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter Bachelor degree details",
                                        style:
                                        TextStyle(fontSize: height * .02),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              _isShow3 =! _isShow3;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _isShow3,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standardcollage,
                                          decoration: InputDecoration(
                                            hintText: "Enter yur Collage name",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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


                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      Container(
                                        height: height * .08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2B5871), width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Image of Sheet",
                                                style:
                                                TextStyle(fontSize: height * .02),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(
                                                        () {
                                                      _isShow1 = !_isShow1;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline_sharp,
                                                  size: 20,
                                                ),
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: _isShow1,
                                          child: Text(""))
                                      ,SizedBox(height: height*.02,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardCpercentage,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Percentage",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardCPasssingYear,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Passing year",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )),
                              SizedBox(height: height*.02,),
                              Container(
                                height: height * .08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xffE69023), width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter Master degree details",
                                        style:
                                        TextStyle(fontSize: height * .02),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              _isShow4 =! _isShow4;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _isShow4,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standardMaster,
                                          decoration: InputDecoration(
                                            hintText: "Enter Master Collage  ",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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

                                      SizedBox(
                                        height: height*.01,
                                      ),
                                      Container(
                                        height: height * .08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2B5871), width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Image of Sheet",
                                                style:
                                                TextStyle(fontSize: height * .02),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(
                                                        () {
                                                      _isShow1 = !_isShow1;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline_sharp,
                                                  size: 20,
                                                ),
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: _isShow1,
                                          child: Text("data"))
                                      ,SizedBox(height: height*.02,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller:_standardMpercentage,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Percentage",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * .08,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standardMPasssingYear,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Passing year",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )),
                              SizedBox(height: height*.02,),
                              Text("School Details (for std I to IX)",style: TextStyle(
                                  fontSize: height*.02,
                                  fontWeight: FontWeight.w600
                              ),),
                              SizedBox(height: height*.01,),

                              Container(
                                height: height * .08,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color: Color(0xffE69023), width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Enter Your Schooling detail",
                                        style:
                                        TextStyle(fontSize: height * .02),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(
                                                () {
                                              _isShow5 =! _isShow5;
                                            },
                                          );
                                        },
                                        icon: Icon(
                                          Icons.add_circle_outline_sharp,
                                          size: 20,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                  visible: _isShow5,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      TextField(
                                          controller: _standard1to1Xschool,
                                          decoration: InputDecoration(

                                            hintText: "Enter School Name",
                                            border: InputBorder.none,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Color(0xff2B5871),
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
                                      SizedBox(
                                        height: height * .01,
                                      ),

                                      Container(
                                        height: height * .08,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Color(0xff2B5871), width: 3)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Image of Sheet",
                                                style:
                                                TextStyle(fontSize: height * .02),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(
                                                        () {
                                                      _isShow1 = !_isShow1;
                                                    },
                                                  );
                                                },
                                                icon: Icon(
                                                  Icons.add_circle_outline_sharp,
                                                  size: 20,
                                                ),
                                              ),
                                            ],

                                          ),
                                        ),
                                      ),
                                      Visibility(
                                          visible: _isShow1,
                                          child: Text("data"))
                                      ,SizedBox(height: height*.02,),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: height * .15,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standard1toXpercentage,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Percentage",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: height * .15,
                                            width: width * .43,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(20)),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                TextField(
                                                  controller: _standard1toXPasssingYear,
                                                  keyboardType:
                                                  TextInputType.number,
                                                  decoration: InputDecoration(
                                                    hintText: "Passing year",
                                                    border: InputBorder.none,
                                                    enabledBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xff2B5871),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                    focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide:
                                                        BorderSide(
                                                          color: Color(
                                                              0xffE69023),
                                                          width: 3,
                                                        ),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            15)),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                        ],
                                      ),

                                    ],
                                  )),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height*.02,),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
