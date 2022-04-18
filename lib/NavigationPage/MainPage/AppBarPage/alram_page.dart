import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alram_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '알림',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _buildAlramPage());
  }
}

class _buildAlramPage extends StatelessWidget{
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
