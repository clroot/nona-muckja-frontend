import 'package:flutter/material.dart';
import 'package:nonamukja/blocs/party/party_detail_bloc.dart';
import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/widget/party/party_detail.dart';
import 'package:intl/intl.dart';

import '../../resources/service/category_maping.dart';

class PartyCard extends StatelessWidget {
  const PartyCard(
      {Key? key,
      required this.partyTitle,
      required this.partyLocation,
      required this.partyTime,
      required this.category,
      required this.limitMemberCount,
      required this.memberNum,
      required this.id})
      : super(key: key);

  final String partyTitle;
  final String partyLocation;
  final String? partyTime;
  final String category;
  final int? limitMemberCount;
  final int memberNum;
  final int? id;

  @override
  Widget build(BuildContext context) {
    PartyDetailBloc _partyDetailBloc = PartyDetailBloc();
    PartyDetailModel _partyDetailModel = PartyDetailModel();
    String time = DateFormat.jm().format(DateTime.parse(partyTime.toString()));

    return GestureDetector(
      onTap: () async {
        _partyDetailModel = await _partyDetailBloc.requestPartyDetail(id);
        await showDialog(
          context: context,
          builder: (BuildContext context) {
            return PartyDetailDialog(
              partyDetailModel: _partyDetailModel,
            );
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(left: 20)),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImgMapping[category]), fit: BoxFit.fill),
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
                      time,
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
                      StringMapping[category],
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
                      Icons.person,
                      size: 14,
                      color: Color.fromARGB(255, 127, 91, 255),
                    ),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    Text(
                      '$memberNum / $limitMemberCount',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'MinSans-Medium'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PartyHistoryCard extends StatelessWidget {
  const PartyHistoryCard(
      {Key? key,
      required this.partyTitle,
      required this.partyLocation,
      required this.partyTime,
      required this.category,
      required this.limitMemberCount,
      required this.memberNum,
      required this.id})
      : super(key: key);
  final String partyTitle;
  final String partyLocation;
  final String? partyTime;
  final String category;
  final int? limitMemberCount;
  final int memberNum;
  final int? id;

  @override
  Widget build(BuildContext context) {
    String time = DateFormat.jm().format(DateTime.parse(partyTime.toString()));
    return GestureDetector(
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width * 0.90,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 10),
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImgMapping[category]), fit: BoxFit.fill),
                color: Color.fromARGB(255, 228, 236, 251),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(padding: EdgeInsets.only(top: 8)),
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
                      time,
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
                      StringMapping[category],
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
                      Icons.person,
                      size: 14,
                      color: Color.fromARGB(255, 127, 91, 255),
                    ),
                    Padding(padding: EdgeInsets.only(left: 3)),
                    Text(
                      '$memberNum / $limitMemberCount',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'MinSans-Medium'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
