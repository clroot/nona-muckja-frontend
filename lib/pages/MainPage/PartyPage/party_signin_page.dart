import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PartySigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '파티 생성',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: BuildPartySigninPage());
  }
}

class BuildPartySigninPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[],
        ));
  }
}
