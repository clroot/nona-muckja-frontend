import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notice_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            '공지사항',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _buildNotice());
  }
}

class _buildNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Notice_Container(),
        Notice_Container(),
        Notice_Container(),
        Notice_Container(),
        Notice_Container(),
      ],
    ));
  }
}

class Notice_Container extends StatelessWidget {
  TextStyle boldStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Test'),
      trailing: const Icon(
        CupertinoIcons.chevron_forward,
        size: 15,
      ),
    );
  }
}
