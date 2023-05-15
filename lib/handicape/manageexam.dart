import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Managemyexam extends StatefulWidget {
  const Managemyexam({Key? key}) : super(key: key);

  @override
  State<Managemyexam> createState() => _ManagemyexamState();

}

class _ManagemyexamState extends State<Managemyexam> {

  @override
  int _value=0;
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      body:SafeArea(
        child: StreamBuilder<QuerySnapshot>(

          stream:  FirebaseFirestore.instance.collection("Exam").doc(FirebaseAuth.instance.currentUser?.email).collection("DetailsOfWriter").snapshots(),
          builder:(context, snapshot){
            return Padding(padding: EdgeInsets.symmetric(horizontal: 10) ,
                child:
                ListView.builder(
                  physics:  BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.size,
                  itemBuilder: (context, index) {
                    var docid= snapshot.data!.docs[index].id;
                    DocumentSnapshot user = (snapshot.data! as QuerySnapshot).docs[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 38.0,left: 10,right: 10),
                      child: Container(
                        height: height*.15,


                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20),boxShadow:[BoxShadow(blurRadius: 15,color: Colors.grey,spreadRadius: 3)] ),
                        child:Padding(

                          padding: const EdgeInsets.only(top: 15,left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user["Suject"],style: TextStyle(color: Color(0xff2B5871),fontSize: height*.03),),
                              SizedBox(height: height*.01,),
                              Text(user["Examtime"],style: TextStyle(fontSize: 20),),
                              // Text(docid,style: TextStyle(fontSize: 20),),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0,right: 10),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: ()  {
                                      },
                                      child: Container(
                                          height: height*.036,
                                          width: width*.2,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
                                          child: Text("Share",style: TextStyle(color: Colors.white,fontSize: height*.02),)),
                                    ),
                                    SizedBox(width: width*.01),
                                    Container(
                                        height: height*.036,
                                        width: width*.2,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(color: Color(0xff2B5871),borderRadius: BorderRadius.circular(5)),
                                        child: Text("Edit",style: TextStyle(color: Colors.white,fontSize: height*.02),)),
                                    SizedBox(width: width*.01),
                                    GestureDetector(
                                      onTap: () async {

                                        await FirebaseFirestore.instance.collection("Exam").doc(FirebaseAuth.instance.currentUser?.email).collection("DetailsOfWriter").doc(docid).delete();

                                      },
                                      child: Container(
                                          height: height*.036,
                                          width: width*.2,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(color: Color(0xffE69023),borderRadius: BorderRadius.circular(5)),
                                          child: Text("Delete",style: TextStyle(color: Colors.white,fontSize: height*.02),)),
                                    ),


                                  ],
                                ),
                              ),

                            ],

                          ),
                        ),
                      ),
                    )

                    ;
                  },
                )
            );
          },

        ),

      ) ,
    );
  }
}
