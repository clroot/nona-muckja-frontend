import 'package:flutter/material.dart';
import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/resources/providers/party/party_join_provider.dart';

class PartyDetailDialog extends StatelessWidget {
  PartyDetailDialog({
    Key? key,
    required this.partyDetailModel,
  }) : super(key: key);

  final PartyDetailModel partyDetailModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(partyDetailModel.title.toString(),
                  style: TextStyle(
                      color: Color.fromARGB(255, 127, 91, 255),
                      fontSize: 25,
                      fontFamily: 'MinSans-Medium')),
              Padding(padding: EdgeInsets.only(top: 15)),
              Text(partyDetailModel.address!.roadAddress.toString(),
                  style: TextStyle(fontSize: 15, fontFamily: 'MinSans-Medium')),
              Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    size: 14,
                    color: Color.fromARGB(255, 127, 91, 255),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    partyDetailModel.currentMemberCount.toString() +
                        ' / ' +
                        partyDetailModel.limitMemberCount.toString(),
                    style: TextStyle(
                      color: Color.fromARGB(255, 127, 91, 255),
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium',
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
