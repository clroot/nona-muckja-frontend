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
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 188, 200, 218),
              offset: Offset(0, 10),
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
