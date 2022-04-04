import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'follow_list_page.dart';

class Chat_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: false,
          title: Text(
            '피드',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.list_bullet),
              padding: const EdgeInsets.only(right: 15),
              onPressed: () => pushNewScreen(context,
                  screen: Follow_List(), withNavBar: false),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Chat_Container(),
            Chat_Container(),
            Chat_Container(),
          ],
        )));
  }
}

/*
  Feed 컨테이너
 */
class Chat_Container extends StatelessWidget {
  // 볼드 텍스트 스타일
  TextStyle boldStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 피드 상단바
        ListTile(
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
          trailing: const Icon(Icons.more_vert),
        ),
        //피드 이미지 공간
        GestureDetector(
            child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SizedBox(
              height: 400,
              width: 400,
              child: Text("Image"),
            ),
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: const EdgeInsets.only(left: 20.0, top: 40.0)),
            GestureDetector(
              child: Icon(CupertinoIcons.heart, size: 25.0, color: Colors.pink),
            )
          ],
        )
      ],
    ));
  }
}
