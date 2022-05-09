import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class EtcCard extends StatelessWidget {
  const EtcCard(
      {Key? key,
      required this.changePage,
      required this.content,
      required this.icon})
      : super(key: key);

  final String content;
  final IconData icon;
  final Widget changePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 252, 255),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 188, 200, 218),
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]),
      child: ListTile(
        onTap: () =>
            pushNewScreen(context, screen: changePage, withNavBar: false),
        leading: Icon(this.icon),
        title: Text(this.content),
        trailing: const Icon(
          CupertinoIcons.chevron_forward,
          size: 15,
        ),
      ),
    );
  }
}

class PartyCard extends StatelessWidget {
  const PartyCard({
    Key? key,
    required this.partyTitle,
  }) : super(key: key);

  final String partyTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 236, 251),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  partyTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'MinSans-Medium'),
                ),
                Text(
                  partyTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium'),
                ),
              ],
            )
          ],
        ));
  }
}


class ChatCard extends StatelessWidget {
  const ChatCard({
    Key? key,
    required this.chatTitle,
  }) : super(key: key);

  final String chatTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.09,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: MediaQuery.of(context).size.width * 0.20,
              height: MediaQuery.of(context).size.height * 0.20,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 228, 236, 251),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  chatTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'MinSans-Medium'),
                ),
                Text(
                  chatTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium'),
                ),
              ],
            )
          ],
        ));
  }
}
