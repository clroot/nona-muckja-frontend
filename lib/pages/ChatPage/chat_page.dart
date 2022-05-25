import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/widget/etc/card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 127, 91, 255)),
          elevation: 0,
          centerTitle: false,
          actions: [
            IconButton(
              icon: Icon(CupertinoIcons.bell),
              padding: const EdgeInsets.only(right: 15),
              onPressed: () => pushNewScreen(context,
                  screen: AlramPage(), withNavBar: false),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Divider(),
              ChatCard(chatTitle: '디디치킨'),
              Divider(),
              ChatCard(chatTitle: '대윤파닭'),
              Divider(),
              ChatCard(chatTitle: '엽기떡볶이'),
              Divider(),
              ChatCard(chatTitle: '롯데리아'),
              Divider(),
              ChatCard(chatTitle: '맥도날드'),
              Divider(),
            ],
          )),
        ));
  }
}
