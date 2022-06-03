import 'package:flutter/material.dart';

class PartyJoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _partyInfo = Map<String, dynamic>();
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
      body: BuildPartyJoinPage(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color.fromARGB(255, 127, 91, 255),
          child: const Icon(Icons.check)),
    );
  }
}

class BuildPartyJoinPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Card(
          child: ListTile(
            title: const Text('파티제목'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('매장링크'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('인원 수'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('카테고리'),
          ),
        ),
        Card(
          child: ListTile(
            title: const Text('모임 시간'),
          ),
        ),
        // FloatingActionButton(onPressed: )
      ],
    );
  }
}
