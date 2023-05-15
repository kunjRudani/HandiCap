import 'package:flutter/material.dart';
import 'package:login/collection/writerinfo.dart';

import 'handicape/handiInfo.dart';

class Selection extends StatefulWidget {
  const Selection({Key? key}) : super(key: key);

  @override
  State<Selection> createState() => _SelectionState();
}

enum Producttypeemun { Writer, WriteFinder }

Producttypeemun? _producttypeemun;

class _SelectionState extends State<Selection> {
  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body:  Stack(

        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: -height*.5,
            right: width*.05,
            child: CircleAvatar(
                radius: height*.38,
                backgroundColor: Color(0xffE69023).withOpacity(.25)),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * .29),
            child: Column(
              children: [

                Text(
                  "Please Identify Your Role",
                  style: TextStyle(fontSize: 28),
                ),

                Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * .08,
                      ),
                      Padding(padding: EdgeInsets.all(20),
                        child: Column(
                          children: [


                            RadioListTile(
                              value: Producttypeemun.Writer,
                              groupValue: _producttypeemun,
                              title: Text(
                                Producttypeemun.Writer.name,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              focusNode: FocusNode(),

                              activeColor: Color(0xffE69023),
                              tileColor: Colors.black,

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              onChanged: (value) {
                                setState(() {
                                  _producttypeemun = value;
                                });
                              },
                            ),

                            SizedBox(height: height*.05),
                            RadioListTile(
                              value: Producttypeemun.WriteFinder,
                              groupValue: _producttypeemun,
                              title: Text(Producttypeemun.WriteFinder.name, style: TextStyle(
                                fontSize: 20, color: Colors.white,),),
                              tileColor: Colors.black,

                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              activeColor: Color(0xffE69023),
                              onChanged: (value) {
                                setState(() {
                                  _producttypeemun = value;
                                });
                              },
                            )
                          ],
                        ),
                      )
                    ],
                  ),

                ),
                Padding(padding: EdgeInsets.only( top:height*.06,right: height*.05),
                  child:Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Container(
                        height: height*.05,
                        width: width*.3,
                        alignment: Alignment.center,

                        decoration: BoxDecoration(color: Color(0xffE69023),borderRadius: BorderRadius.circular(30)),
                        child: GestureDetector(
                          onTap: (){

                            if(Producttypeemun.WriteFinder==_producttypeemun){
                              Navigator.push(context,MaterialPageRoute(builder: (context) => Handicapeinfo() ));
                            }else if(Producttypeemun.Writer==_producttypeemun)
                            {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Writerinfo(),));
                            }
                          },
                          child: Text("Next"),
                        ),
                      )
                    ],),
                ),



              ],
            ),

          ),




        ],
      ),
    );
  }
}
