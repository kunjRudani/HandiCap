import 'package:flutter/material.dart';
import 'package:login/collection/setting.dart';
import 'package:login/collection/writerHomeScreen.dart';
import 'package:login/collection/writerchat.dart';



class custombar1 extends StatefulWidget {
  const custombar1({Key? key}) : super(key: key);

  @override
  State<custombar1> createState() => _custombar1State();
}

class _custombar1State extends State<custombar1> {
  int _bool = 0;
  List<Widget> body =[

    Homescreen1() ,
    Chat1(),
    Setting1()

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: body[_bool],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bool,
        backgroundColor: Colors.black,
        selectedItemColor:  Color(0xffE69023) ,
        unselectedItemColor: Colors.white,
        // fixedColor: Colors.black,
        type: null,

        onTap: (int newindex){
          setState(() {

            _bool=newindex;
          });
        },
        items:[
          BottomNavigationBarItem(
            label: "home",
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),

          ),

          BottomNavigationBarItem(
            label: "Chat",
            backgroundColor: Colors.black,
            icon: Icon(Icons.wechat_rounded),

          ),
          BottomNavigationBarItem(
            label: "Setting",
            backgroundColor: Colors.black,
            icon: Icon(Icons.person_pin),

          ),
        ],

      ),
    );
  }
}


