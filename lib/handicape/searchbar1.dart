import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Tp extends StatefulWidget {
  const Tp({Key? key}) : super(key: key);

  @override
  State<Tp> createState() => _TpState();
}

class _TpState extends State<Tp> {
  List _allresult=[];
  List _resultlist=[];
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    getClientStream();
    _searchController.addListener(_onSearch);
    super.initState();
  }
  _onSearch(){
    print(_searchController.text);
    searchreuslt();
  }
  searchreuslt(){
    var showResult=[];
    if(_searchController.text !="" ){
      for(var clientsnapshot in _allresult ){
        var name = clientsnapshot["city"].toString().toLowerCase();
        if(name.contains(_searchController.text.toLowerCase())){
          showResult.add(clientsnapshot);
        }
      }
    }
    else{
      showResult =  List.from(_allresult);
    }
    setState(() {

      _resultlist=showResult;
    });
  }
  getClientStream() async {
    var data = await FirebaseFirestore.instance.collection("DetailsOfWriter").orderBy("city").get();
    setState(() {
      _allresult =data.docs;
    }
    );
    searchreuslt();

  }
  @override
  void dispose() {
    _searchController.removeListener(_onSearch);
    _searchController.dispose();
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    getClientStream();
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:Color(0xff009688),
          title: Text("Search for Writer with Location"),

        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CupertinoSearchTextField(
                controller: _searchController,
              ),
            ),
            Expanded(
              child: Container(

                child: StreamBuilder<QuerySnapshot>(
                    stream:  FirebaseFirestore.instance.collection("DetailsOfWriter").snapshots(),
                    builder: (context, snapshot) {
                      return ListView.builder(
                        itemCount: _resultlist.length,
                        itemBuilder: (context, index) {
                          DocumentSnapshot DetailsOfWriter = (snapshot.data! as QuerySnapshot).docs[index];
                          return InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context) => Product(task: preminum_watch),));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                              child: Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child:ListTile
                                    (
                                    title: Text(_resultlist[index]["city"]),
                                    subtitle: Text(_resultlist[index]["name"]),
                                    trailing:     Image.network(_resultlist[index]["image"],height: 150,),


                                  )),
                            ),
                          );
                        },);
                    }
                ),
              ),
            ),
          ],
        )
    );
  }
}
