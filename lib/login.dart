import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


final emailController=TextEditingController();
final passController=TextEditingController();
  @override

  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double widht= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xff21222D),
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
              left: -widht*.12,
              top: -height*.25,
              child: CircleAvatar(
                backgroundColor: Color(0xffE69023),
            radius: height*.25,))
,
           Column(

               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
             SizedBox(height: height*.3,),
             Text("Welcome",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: height*.05) ),
             Text("Back!!",style:TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: height*.05) ),
                 SizedBox(height: height*.02,),
             Padding(
               padding: const EdgeInsets.symmetric( horizontal: 16),

               child: Container(
                 height: height*.08,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(45),
                     border: Border.all(width: 2,color: Color(0xffE69023))),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 13,left: 20),
                   child: TextField(
                     style: TextStyle(color: Color(0xffE69023)),
                     decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:" E-mail" ,

                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon:Icon(Icons.person,color:Color(0xffE69023),)),
                     controller: emailController,

                   ),
                 ),
               ),
             ),
             SizedBox(height: height*.02,),
             Padding(
               padding: const EdgeInsets. symmetric(horizontal: 16.0),
               child: Container(
                 height: height*.08,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(45),
                     border: Border.all(width: 2,color: Color(0xffE69023))),
                 child: Padding(
                   padding: const EdgeInsets.only(top: 13,left: 20),
                   child: TextField(
                     style: TextStyle(color: Color(0xffE69023)),
                     controller: passController,
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           hintText:" Password" ,

                           hintStyle: TextStyle(color: Colors.white),
                           suffixIcon:Icon(Icons.person,color:Color(0xffE69023),)),



                   ),
                 ),
               ),
             ),
             SizedBox(height: height*.2,),
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Sign Up", style: TextStyle(color: Colors.white,fontSize: height*.028)),


                   GestureDetector(onTap: (){
                     FirebaseAuth.instance.signInWithEmailAndPassword(
                         email: emailController.text.trim(),
                         password: passController.text.trim());
                   }
                       , child: Container(
                           height: height*.055,
                           width: widht*.3,
                           padding: EdgeInsets.only(bottom: 10),
                           decoration:  BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color(0xffE69023),),
                           child: Center(child: Icon(Icons.arrow_right_alt_sharp,color: Colors.white,size: height*.06,)))),
                 ],
               ),
             )

           ]),



        ],
      ),
    );
  }
}
