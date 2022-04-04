
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
  팔로우 리스트 창
*/
class Follow_List extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          elevation:  0,
          centerTitle: false,
          title : Text(
            'Test',
            style:  TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
Follow_List_Container(),
                Follow_List_Container(),
                Follow_List_Container(),
                Follow_List_Container(),
                Follow_List_Container(),
              ],
            )
        )
    );
  }
}

class Follow_List_Container extends StatelessWidget{

  TextStyle boldStyle =
  TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: null,
        backgroundColor: Colors.red,
      ),
      title: GestureDetector(
        child: Text('TEST', style: boldStyle),
        onTap: () {
          print('TEST Tapped');
        },
      ),
      subtitle: Text("TEST Subtitle"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

        ],
      ),
    );

  }
}