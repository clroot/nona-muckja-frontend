import 'package:flutter/material.dart';
import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/resources/providers/party/party_join_provider.dart';

class PartyJoinPage extends StatelessWidget {
  const PartyJoinPage({
    Key? key,
    required this.partyDetailModel,
  }) : super(key: key);

  final PartyDetailModel partyDetailModel;

  @override
  Widget build(BuildContext context) {
    PartyJoinProvider _partyJoinProvider = PartyJoinProvider();
    Map<String, dynamic> _partyJoinResualt;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          '파티 참가',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.title, color: Color.fromARGB(255, 127, 91, 255)),
              title: Text(partyDetailModel.title.toString()),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('매장링크'),
            ),
          ),
          Card(
            child: ListTile(
              leading:
                  Icon(Icons.person, color: Color.fromARGB(255, 127, 91, 255)),
              title: Text(partyDetailModel.currentMemberCount.toString() +
                  ' / ' +
                  partyDetailModel.limitMemberCount.toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.food_bank_rounded,
                  size: 30, color: Color.fromARGB(255, 127, 91, 255)),
              title: Text('카테고리'),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('모임 시간'),
            ),
          ),
          // FloatingActionButton(onPressed: )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            _partyJoinResualt =
                await _partyJoinProvider.partyJoinProvider(partyDetailModel.id);
            Navigator.pop(context, _partyJoinResualt);
          },
          backgroundColor: Color.fromARGB(255, 127, 91, 255),
          child: const Icon(Icons.check)),
    );
  }
}
