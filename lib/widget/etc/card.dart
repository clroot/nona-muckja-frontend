import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//
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
              offset: Offset(0, 3),
              blurRadius: 4,
            )
          ]),
      child: ListTile(
        iconColor: Color.fromARGB(255, 127, 91, 255),
        onTap: () =>
            pushNewScreen(context, screen: changePage, withNavBar: false),
        leading: Icon(this.icon),
        title:
            Text(this.content, style: TextStyle(fontFamily: 'MinSans-Medium')),
        trailing: const Icon(
          CupertinoIcons.chevron_forward,
          size: 15,
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.changePage,
    required this.content,
  }) : super(key: key);

  final String content;
  final Widget changePage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 127, 91, 255),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.blue.withAlpha(30),
          onTap: () =>
              pushNewScreen(context, screen: changePage, withNavBar: false),
          child: Center(
            child: Text(
              this.content,
              style: TextStyle(fontSize: 25, fontFamily: 'MinSans-Medium'),
            ),
          ),
        ),
      ),
    );
  }
}
