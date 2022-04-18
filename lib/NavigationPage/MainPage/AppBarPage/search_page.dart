import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          elevation: 0.0,

          title: TextField(
            decoration: InputDecoration(
              icon: Icon(CupertinoIcons.search),
              hintText: 'search...',
              hintStyle: TextStyle(
               color: Colors.grey,
                fontSize: 18,
                fontStyle: FontStyle.italic,
            ),
              border: InputBorder.none
          ),
          ),

          backgroundColor: Colors.white,
        ),
        body: _buildSearch_Page());
  }
}

class _buildSearch_Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[

          ],
        )
    );
  }
}
