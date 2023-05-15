

import 'package:flutter/material.dart';
import 'package:login/handicape/chat.dart';
import 'package:login/handicape/postexam.dart';
import 'package:login/handicape/settingH.dart';

import 'homescreen.dart';



class  Custombar  extends StatefulWidget {


  @override
  State<Custombar> createState() => _CustombarState();
}

class _CustombarState extends State<Custombar> {
  int _bool = 0;
  List<Widget> body =[

    Homescreen() ,
    Infoexam(),
    Chat(),
    Setting()

  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(
        child: body[_bool],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bool,
        backgroundColor: Colors.pink,
        selectedItemColor:  Color(0xffE69023) ,
        type: null,
        // fixedColor: Colors.black,

        onTap: (int newindex){
          setState(() {

            _bool=newindex;
          });
        },
        items:[
          BottomNavigationBarItem(
            label: "home",
            backgroundColor: Colors.black,
            icon: Icon(Icons.home),

          ),
          BottomNavigationBarItem(
            label: "Info",
            backgroundColor: Colors.black,
            icon: Icon(Icons.info_outline),

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
