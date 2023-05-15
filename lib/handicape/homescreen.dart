
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login/handicape/searchbar1.dart';

import 'manageexam.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(

      backgroundColor: Colors.white,
      drawer: Drawer(

        child: Container(

          child: Column(

            children: [
              Container(
                height: height*.30,
                width: double.infinity,
                color: Color(0xff21222D),

                child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Column(
                    children: [
                      Text("Netflex",style: TextStyle(color: Colors.white,fontSize: 35),
                      ),
                      Text("Slogan",style: TextStyle(color: Colors.white,fontSize: 20))
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(

                      child: Row(

                        children: [
                          SizedBox(height: height*.09),
                          Text("Customer Support",style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.phone,color: Color(0xff2B5871),),
                          SizedBox(width: width*.02,),
                          Text("+91 6353556696 ",style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),

                    SizedBox(height:height*.02),
                    Container(
                      child: Row(
                        children: [
                          Icon(Icons.email,color: Color(0xff2B5871),),
                          SizedBox(width: width*.02,),
                          Text("support.kunjrudani7@gmail.com ",style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    Divider(thickness: 2,color: Color(0xff21222D),),
                    SizedBox(height: height*.04,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Managemyexam(),));
                          },
                          child: Row(
                            children: [
                              Text("Manage My Posts",style: TextStyle(color: Color(0xff21222D),fontSize: 19,fontWeight: FontWeight.w600),),
                              Icon(Icons.keyboard_arrow_right_sharp)
                            ],
                          ),
                        )
                      ],
                    )

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.filter_list),
          )
        ],
        title: Container(
            height: height*.07,
            width: double.infinity,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(

                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,

                        boxShadow:[ BoxShadow(  blurRadius: 1,)]
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:
                          8.0),
                          child: Icon(Icons.search_off_outlined,color: Color(0xffE69023),),
                        ),
                        Container(
                            height: 50,
                            width: width*.65,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 0,left: 10),
                              child: TextFormField(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tp(),));
                                },
                                decoration: InputDecoration(
                                    hintText: "Find with subject, date or stream",
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),



                ],
              ),
            )
        ),
        iconTheme: IconThemeData(
            color: Color(0xffE69023)
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: height*.015),
          child: Scaffold(
              backgroundColor: Colors.white,
              body: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  SizedBox(height: height*.035,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Location Based writer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                        Text("Veiw All",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*.01,),
                  Container(
                    height: height*.27,
                    width: width*.45,
                    child:StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection("DetailsOfWriter").snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data?.size,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            DocumentSnapshot user=(snapshot.data! as QuerySnapshot).docs[index];

                            return SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,

                              child: Row(

                                children: [

                                  GestureDetector(
                                    onTap: (){},
                                    child: Container(
                                      height: height*.26,
                                      width: width*.45,
                                      decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          border: Border.all(color: Color(0xff2B5871,),width: 3)
                                      ),
                                      child: Column(

                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5.0),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.network( user["image"],height: 140,),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(user["name"], style: TextStyle(
                                                    fontSize: 16,fontWeight: FontWeight.bold
                                                ),),
                                                Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Engineer', style: TextStyle(
                                                  fontSize: 16,
                                                ),),

                                                Text('surat',style: TextStyle(fontSize: 16),),

                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 5,),

                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                            child: Row(

                                              children: [
                                                Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                                SizedBox(width: 10,),
                                                Text("200+"),
                                                SizedBox(width: 20,),
                                                Text("Exam")
                                              ],
                                            ),
                                          ),



                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 9,),


                                ],
                              ),
                            );
                          },);
                      },
                    )
                    ,),

                  SizedBox(height: height*.02,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Education Based writer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                        Text("Veiw All",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*.01,),

                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,

                    child: Row(

                      children: [

                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 9,),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 9,),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: height*.02,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Experience Based writer",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                        Text("Veiw All",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
                      ],
                    ),
                  ),
                  SizedBox(height: height*.01,),

                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,

                    child: Row(

                      children: [

                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 9,),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 9,),
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: height*.26,
                            width: width*.45,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Color(0xff2B5871,),width: 3)
                            ),
                            child: Column(

                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("https://s3-alpha-sig.figma.com/img/79fb/b8de/84c6b5fc7a2e63d5923f2e9a7d5bda77?Expires=1683504000&Signature=EcLyWajONz6jg3fwyyoodollFc3wgoPNLJo2OnjZO0itjMRQY1tDYyDJrLRbcDudU5Ue6ANimuI4VPTeq-MscusZAuuXepmIW9stG1cXbQMMdSHff0ShdUqxa9qrtYtyKp069vjTNp~sF9RX05psoidaPTrvuanyAc4iyAEJ3vvYg~W5XnTy8of0zDTnfZYNW~hmaK65RlW3NnYyzEE7pf~MvTNgWGnjh4V52RuJ53kDlcFD-0AWQ1YO7m8msAeILPF3sOmxqaF-C9WtgQDIFFnQrRg4uQyC1fRcoemTwSd-XSTzXWS13pBhgGIoAbANOqI5P1MQ6U-kyDQC24l-vA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",height: 140,),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Name', style: TextStyle(
                                          fontSize: 16,fontWeight: FontWeight.bold
                                      ),),
                                      Text('4.5',style: TextStyle(color: Color(0xffE69023),fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Engineer', style: TextStyle(
                                        fontSize: 16,
                                      ),),

                                      Text('surat',style: TextStyle(fontSize: 16),),

                                    ],
                                  ),
                                ),
                                SizedBox(height: 5,),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Row(

                                    children: [
                                      Icon(Icons.list_alt_sharp,color: Color(0xffE69023),),
                                      SizedBox(width: 10,),
                                      Text("200+"),
                                      SizedBox(width: 20,),
                                      Text("Exam")
                                    ],
                                  ),
                                ),



                              ],
                            ),
                          ),
                        ),

                      ],
                    ),
                  )
                ],

              )
          ),
        ),
      ),
    );
  }
}
