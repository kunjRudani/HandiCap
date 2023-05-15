import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {




  // final CollectionReference _myCollection = FirebaseFirestore.instance.collection('abc');
  // Future<void> getData() async {
  //   try {
  //     final QuerySnapshot querySnapshot = await _myCollection.get();
  //     final List<DocumentSnapshot> documents = querySnapshot.docs;
  //     // Do something with the data
  //     name= name;
  //   } catch (e) {
  //     // Handle the error
  //   }
  // }
  //
  // void listenToData() {
  //   _myCollection.snapshots().listen((querySnapshot) {
  //     final List<DocumentSnapshot> documents = querySnapshot.docs;
  //     // Do something with the updated data
  //   });
  // }
  //
  //






  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return  SafeArea(
      child: Scaffold(
        body: StreamBuilder< QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("user").doc(FirebaseAuth.instance.currentUser!.email).collection("HandicapeOfWriter").snapshots(),
          builder: (context, snapshot) {
            return  ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {

                  DocumentSnapshot user=(snapshot.data! as QuerySnapshot).docs[index];
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
                      child: Column(
                        children: [
                          SizedBox(height: height*.02,),

                          Stack(children: [

                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: height*.1,
                                child: Image.network(
                                  user['image'],
                                  height: height*.2,),
                              ),
                            ),
                            Positioned(
                                left: width*.3,
                                child: Icon(Icons.camera_enhance,size: height*.05,)),
                          ]),
                          SizedBox(height: height*.06,),
                          Container(
                            height: height*.08,
                            width: width*.9,
                            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),color: Colors.white,boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Color(0xffE69023),size: height*.045),
                                  SizedBox(width: width*.042,),
                                  Text(user['name'],style: TextStyle(fontSize: height*.027,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*.02,),
                          Container(
                            height: height*.08,
                            width: width*.9,
                            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),color: Colors.white,boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Color(0xffE69023),size: height*.045),
                                  SizedBox(width: width*.042,),
                                  Text(user['number'],style: TextStyle(fontSize: height*.027,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*.02,),
                          Container(
                            height: height*.08,
                            width: width*.9,
                            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),color: Colors.white,boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Color(0xffE69023),size: height*.045),
                                  SizedBox(width: width*.042,),
                                  Text(user['gender'],style: TextStyle(fontSize: height*.027,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*.02,),
                          Container(
                            height: height*.08,
                            width: width*.9,
                            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),color: Colors.white,boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Color(0xffE69023),size: height*.045),
                                  SizedBox(width: width*.042,),
                                  Text(user['city'],style: TextStyle(fontSize: height*.027,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: height*.02,),
                          Container(
                            height: height*.08,
                            width: width*.9,
                            decoration: BoxDecoration(borderRadius:  BorderRadius.circular(20),color: Colors.white,boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)]),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Row(
                                children: [
                                  Icon(Icons.person,color: Color(0xffE69023),size: height*.045),
                                  SizedBox(width: width*.042,),
                                  Text(user['state'],style: TextStyle(fontSize: height*.027,fontWeight: FontWeight.w500),)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ) ,
                  );
                });
          },
        ),
      ),
    );
  }
}
