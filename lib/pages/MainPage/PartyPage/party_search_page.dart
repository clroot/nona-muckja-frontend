import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/party_signin_page.dart';
import 'package:nonamukja/widget/party/party_card.dart';
import 'package:nonamukja/blocs/party/party_search_bloc.dart';

class PartySearchPage extends StatefulWidget {
  PartySearchPage({
    Key? key,
    required this.category,
  }) : super(key: key);
  final String category;

  @override
  State<PartySearchPage> createState() => _PartySearchPageState();
}

class _PartySearchPageState extends State<PartySearchPage> {
  PartySearchBloC _partySearchBloC = PartySearchBloC();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _partySearchBloC.fetchPartyList(widget.category);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  buildView(BuildContext context, List<Content>? list) {
    return ListView.separated(
      shrinkWrap: true,
      controller: _scrollController,
      itemCount: list!.length,
      separatorBuilder: (BuildContext context, index) => const Divider(),
      itemBuilder: (BuildContext context, int index) {
        return PartyCard(
          partyTitle: list[index].title.toString(),
          partyLocation: list[index].address!.roadAddress.toString(),
          partyTime: list[index].partyTime,
          category: list[index].foodCategory.toString(),
          memberNum: list[index].members!.length,
          limitMemberCount: list[index].limitMemberCount,
          id: list[index].id,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 127, 91, 255)),
        elevation: 0.0,
        centerTitle: false,
        title: Container(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Text(
                "카테고리",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 127, 91, 255),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder<List<Content>>(
        stream: _partySearchBloC.partySearchList,
        builder: (BuildContext context, AsyncSnapshot<List<Content>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return buildView(context, snapshot.data);
        },
      ),
    );
  }
}
