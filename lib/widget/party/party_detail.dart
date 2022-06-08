import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/resources/providers/party/party_join_provider.dart';
import 'package:nonamukja/resources/providers/party/party_leave_provider.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';

class PartyDetailDialog extends StatelessWidget {
  PartyDetailDialog({
    Key? key,
    required this.partyDetailModel,
  }) : super(key: key);

  final PartyDetailModel partyDetailModel;

  @override
  Widget build(BuildContext context) {
    String time = DateFormat.jm()
        .format(DateTime.parse(partyDetailModel.partyTime.toString()));

    PartyJoinProvider _partyJoinProvider = PartyJoinProvider();
    PartyLeaveProvieder _partyLeaveProvieder = PartyLeaveProvieder();
    String _leaveResualt;
    Map<String, dynamic> _partyJoinResualt;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 14,
                    color: Color.fromARGB(255, 127, 91, 255),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    partyDetailModel.address!.roadAddress.toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium',
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
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
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium',
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: partyDetailModel.currentMemberCount!.toInt(),
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Text(
                        partyDetailModel.members![index].username.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontFamily: 'MinSans-Medium',
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.alarm,
                    size: 14,
                    color: Color.fromARGB(255, 127, 91, 255),
                  ),
                  Padding(padding: EdgeInsets.only(left: 5)),
                  Text(
                    time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontFamily: 'MinSans-Medium',
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: ClayPurpleButton(
                      content: '참여',
                      width: 100,
                      height: 50,
                    ),
                    onTap: () async {
                      _partyJoinResualt = await _partyJoinProvider
                          .partyJoinProvider(partyDetailModel.id);
                      if (_partyJoinResualt['status'] == 200) {
                        print('완료');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(_partyJoinResualt['message'])));
                      }
                      Navigator.pop(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  GestureDetector(
                    child: ClayWhiteButton(
                      content: '나가기',
                      width: 100,
                      height: 50,
                    ),
                    onTap: () async {
                      _leaveResualt = await _partyLeaveProvieder
                          .partyLeaveProvieder(partyDetailModel.id);
                      print(_leaveResualt);
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
