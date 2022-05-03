import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LatelyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            '최근 본 가게',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: BuildLately());
  }
}

class BuildLately extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        LatelyContainer(),
        LatelyContainer(),
        LatelyContainer(),
        LatelyContainer(),
        LatelyContainer(),
      ],
    ));
  }
}

class LatelyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: null,
        backgroundColor: Colors.red,
      ),
      title: Text(
        '가게',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_forward,
        size: 15,
      ),
    );
  }
}
