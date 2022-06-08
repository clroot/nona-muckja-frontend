import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/blocs/party/user_party_join_bloc.dart';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/widget/party/party_card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class PartyHistoryPage extends StatefulWidget {
  @override
  State<PartyHistoryPage> createState() => _PartyHistoryPageState();
}

class _PartyHistoryPageState extends State<PartyHistoryPage> {
  UserPartyBloC _userPartyBloC = UserPartyBloC();

  int page = 0;

  @override
  void initState() {
    super.initState();

    _userPartyBloC.fetchUserPartyList(page);
  }

  Future<void> _onRefresh() async {
    _userPartyBloC.fetchPartyRefresh(0);
  }

  buildView(BuildContext context, List<Content>? list) {
    return ListView.separated(
      shrinkWrap: true,
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
        elevation: 0,
        title: Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            '내 파티',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 127, 91, 255),
              fontFamily: 'MinSans-Medium',
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.bell),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () =>
                pushNewScreen(context, screen: AlramPage(), withNavBar: false),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          child: StreamBuilder<List<Content>>(
            stream: _userPartyBloC.userPartyList,
            builder:
                (BuildContext context, AsyncSnapshot<List<Content>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return buildView(context, snapshot.data);
            },
          ),
        ),
      ),
    );
  }
}
