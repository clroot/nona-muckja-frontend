import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/category_page.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/search_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            '홈',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(CupertinoIcons.search),
              padding: const EdgeInsets.only(right: 15),
              onPressed: () => pushNewScreen(context,
                  screen: SearchPage(), withNavBar: false),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.list_bullet),
              padding: const EdgeInsets.only(right: 15),
              onPressed: () => pushNewScreen(context,
                  screen: CategoryPage(), withNavBar: false),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.bell),
              padding: const EdgeInsets.only(right: 15),
              onPressed: () => pushNewScreen(context,
                  screen: AlramPage(), withNavBar: false),
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Divider(),
            PartyContainer(),
            Divider(),
            PartyContainer(),
            Divider(),
            PartyContainer(),
            Divider(),
          ],
        )));
  }
}

class PartyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // 피드 상단바
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: null,
            backgroundColor: Colors.grey,
          ),
          title: GestureDetector(
            child: Text('파티',
                style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold)),
            onTap: () {
              print('TEST Tapped');
            },
          ),
          subtitle: Text("test\n\n"),
          isThreeLine: true,
        )
      ],
    ));
  }
}
