import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.userName, required this.userRoad})
      : super(key: key);

  final String userName;
  final String userRoad;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment(0, 0.2),
              end: Alignment(0, 1),
              colors: [
                Color.fromARGB(255, 127, 91, 255),
                Color.fromARGB(255, 70, 36, 194),
              ]),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 189, 172, 251),
              offset: Offset(0, 5),
              blurRadius: 15,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            userName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                fontFamily: 'MinSans-Medium',
                color: Colors.white),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          Icon(
            Icons.location_on,
            color: Colors.white,
            size: 30,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            userRoad,
            style: TextStyle(
                fontSize: 15,
                fontFamily: 'MinSans-Medium',
                color: Colors.white),
          ),
        ],
      ),
    );
  }
}
