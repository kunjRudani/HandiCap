
import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../collection/writereducation.dart';
import 'handiEducation.dart';

class Handicapeinfo extends StatefulWidget {


  @override
  State< Handicapeinfo> createState() => _HandicapeinfoState();
}

class _HandicapeinfoState extends State< Handicapeinfo> {
  String imageUrl="";
  @override
  int _value=0;
  String dropdownvalue1 = 'Hand';
  var items1 = ["Hand", "Eye", "Ear", "Other"];
  String error="";



  TextEditingController _name= TextEditingController();
  TextEditingController _number= TextEditingController();
  TextEditingController _aadhar= TextEditingController();
  TextEditingController _date= TextEditingController();
  TextEditingController _gender= TextEditingController();
  TextEditingController _address= TextEditingController();
  TextEditingController _city= TextEditingController();
  TextEditingController _state= TextEditingController();
  TextEditingController _pincode= TextEditingController();
  TextEditingController _disability= TextEditingController();
  TextEditingController _describle= TextEditingController();
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
      bottomNavigationBar:
      Container(
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
                        fontWeight: FontWeight.w600),),



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

                        Navigator.push(context, MaterialPageRoute(builder: (context) =>Education(
                          image:imageUrl.toString() , gender: (_value==0) ? "Male" : "Female", name: _name.text ,number: _number.text, andhar: _aadhar.text, address: _address.text, city: _city.text, state: _state.text, pincode: _pincode.text, disability:_describle.text,


                        ),));
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
                  "Enter Personal details to ",
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
                      Icons.circle_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: height * .02,
                ),
                Container(
                  height: height*.662,

                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.white),

                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
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
                              Text("Your Name",
                                  style: TextStyle(
                                      fontSize: height * .025,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: height * .015,
                              ),
                              TextField(
                                  controller: _name,
                                  decoration: InputDecoration(
                                    hintText: "name",
                                    border: InputBorder.none,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffE69023),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(15)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xffE69023),
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(15)),
                                  )),
                              // SizedBox(height: height*.02,),
                              // Text(error),
                              SizedBox(
                                height: height * .01,
                              ),
                              Text("Mobile No..",
                                  style: TextStyle(

                                      fontSize: height * .025,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: height * .015,
                              ),
                              TextField(
                                controller: _number,
                                decoration: InputDecoration(
                                  hintText: "enter your number",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Text("Aadhar No..",
                                  style: TextStyle(
                                      fontSize: height * .025,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: height * .015,
                              ),
                              TextField(
                                controller: _aadhar,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Adharcard No",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              Text("Birth Date",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
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
                              SizedBox(
                                height: height * .01,
                              ),
                              Text("Set your Gender",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                height: height * .15,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => setState(() {
                                          _value=0;

                                        }),
                                        child: Container(
                                          width: width * .38,
                                          height: height * .09,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: _value==0?Color(0xffE69023):Colors.black,
                                                  width: 4)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30, left: 15),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.boy_outlined,
                                                  color:  _value==0?Color(0xffE69023):Colors.black,
                                                  size: 40,
                                                ),
                                                Text(
                                                  "Male",
                                                  style: TextStyle(
                                                      color:  _value==0?Color(0xffE69023):Colors.black,
                                                      fontSize: height * .02,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () =>setState(() {
                                          _value=1;

                                        }),
                                        child: Container(
                                          width: width * .38,
                                          height: height * .09,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              border: Border.all(
                                                  color: _value==1?Color(0xffE69023):Colors.black,
                                                  width: 4)),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 30, left: 15),
                                            child: Row(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Icon(
                                                  Icons.girl_outlined,
                                                  color:  _value==1?Color(0xffE69023):Colors.black,
                                                  size: 40,
                                                ),
                                                Text(
                                                  "Female",
                                                  style: TextStyle(
                                                      color:  _value==1?Color(0xffE69023):Colors.black,
                                                      fontSize: height * .02,
                                                      fontWeight:
                                                      FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: height * .001,
                              ),
                              Text(
                                "Address",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              TextField(
                                controller: _address,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Address",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: height * .15,
                                    width: width * .37,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "City",
                                          style: TextStyle(
                                              fontSize: height * .025,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: height * .015,
                                        ),
                                        TextField(
                                          controller: _city,

                                          decoration: InputDecoration(
                                            hintText: "Your City",
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: height * .15,
                                    width: width * .37,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "State",
                                          style: TextStyle(
                                              fontSize: height * .025,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: height * .015,
                                        ),
                                        TextField(
                                          controller: _state,

                                          decoration: InputDecoration(
                                            hintText: "Your State",
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
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Pin Code",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              TextField(
                                controller: _pincode,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Pin Code",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Text(
                                "Select Your Disability Type",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              minRnt(
                              ),
                              SizedBox(height: height*.02,),
                              Text(
                                "Profile Photo",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),IconButton(

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
                                    imageUrl=await referenceImageTouplode.getDownloadURL();

                                  }catch(error){}

                                }, icon: Icon(Icons.camera_alt_rounded),),

                              SizedBox(
                                height: height * .02,
                              ),
                              Text(
                                "Describe about your Disability",
                                style: TextStyle(
                                    fontSize: height * .025,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: height * .01,
                              ),
                              TextField(
                                controller: _describle,
                                maxLines: 8, // <-- SEE HERE
                                decoration: InputDecoration(
                                  hintText: "Describe Your Disability here",
                                  border: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xffE69023),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(15)),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xffE69023),
                                      width: 3,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: height * .025,
                              ),
                            ],
                          ),
                        ),
                      ),
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
