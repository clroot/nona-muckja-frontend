import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
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
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: ListTile(
          onTap: () =>
              pushNewScreen(context, screen: changePage, withNavBar: false),
          leading: Icon(this.icon),
          title: Text(this.content),
          trailing: const Icon(
            CupertinoIcons.chevron_forward,
            size: 15,
          ),
        ));
  }
}
