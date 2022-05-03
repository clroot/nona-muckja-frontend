import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoticePage extends StatelessWidget {
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
        body: BuildNotice());
  }
}

class BuildNotice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        NoticeContainer(),
        NoticeContainer(),
        NoticeContainer(),
        NoticeContainer(),
        NoticeContainer(),
      ],
    ));
  }
}

class NoticeContainer extends StatelessWidget {
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
