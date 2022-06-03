import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/party_join_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PartyCard extends StatelessWidget {
  const PartyCard({
    Key? key,
    required this.partyTitle,
    required this.partyLocation,
    required this.partyTime,
    required this.category,
  }) : super(key: key);

  final String partyTitle;
  final String partyLocation;
  final DateTime? partyTime;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          pushNewScreen(context, screen: PartyJoinPage(), withNavBar: false),
      child: Container(
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
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  partyTitle,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'MinSans-Medium'),
                ),
                Text(
                  partyLocation,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium'),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      size: 14,
                      color: Color.fromARGB(255, 127, 91, 255),
                    ),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    Text(
                      '$partyTime.hour : $partyTime.minute',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'MinSans-Medium'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.food_bank_outlined,
                      size: 14,
                      color: Color.fromARGB(255, 127, 91, 255),
                    ),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    Text(
                      category,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontFamily: 'MinSans-Medium'),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PartyHistoryCard extends StatelessWidget {
  const PartyHistoryCard({
    Key? key,
    required this.chatTitle,
  }) : super(key: key);

  final String chatTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 228, 236, 251),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Padding(padding: EdgeInsets.only(left: 15)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(top: 8)),
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
                    color: Colors.grey,
                    fontSize: 15,
                    fontFamily: 'MinSans-Medium'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
