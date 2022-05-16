import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/category_page.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/search_page.dart';
import 'package:nonamukja/widget/card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 127, 91, 255)),
          elevation: 0.0,
          centerTitle: false,
          title: Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text("상도동",
                      style: TextStyle(
                          color: Color.fromARGB(255, 127, 91, 255),
                          fontSize: 25)),
                  Icon(Icons.keyboard_arrow_down),
                ],
              )),
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
        body: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
                child: Column(children: <Widget>[
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
              PartyCard(
                partyTitle: "정보관 디디 치킨",
                partyLocation: "정보관",
              ),
              Divider(),
            ]))));
  }
}
