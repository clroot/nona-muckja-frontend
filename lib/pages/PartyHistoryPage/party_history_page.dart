import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/widget/party/party_card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PartyHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 127, 91, 255)),
          elevation: 0,
          title: Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              '내 파티',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
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
              PartyHistoryCard(partyTitle: 'partyTitle', partyLocation: 'partyLocation', partyTime: '2000-02-13 12-12:00.000', category: 'category', limitMemberCount: 5, memberNum: 5, id: 1)
            ],
          )),
        ));
  }
}
