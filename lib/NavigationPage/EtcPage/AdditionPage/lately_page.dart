import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Lately_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            '최근 본 가게',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _buildLately());
  }
}

class _buildLately extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Lately_Container(),
          Lately_Container(),
          Lately_Container(),
          Lately_Container(),
          Lately_Container(),
        ],
      )
    );
  }
}

class Lately_Container extends StatelessWidget{

  TextStyle boldStyle =
  TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: null,
            backgroundColor: Colors.red,
          ),
      title: Text('가게'),
      trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),
    );

  }
}