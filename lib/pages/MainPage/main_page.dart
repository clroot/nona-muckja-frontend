import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/blocs/party/party_create_bloc.dart';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/category_page.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/party_search_page.dart';
import 'package:nonamukja/blocs/party/party_list_bloc.dart';
import 'package:nonamukja/pages/MainPage/PartyPage/party_signin_page.dart';
import 'package:nonamukja/widget/party/party_card.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PartyListBloC _partyListBloC = PartyListBloC();
  final ScrollController _scrollController = ScrollController();

  int page = 0;

  @override
  void initState() {
    super.initState();
    _partyListBloC.fetchPartyList(page);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _partyListBloC.fetchPartyList(++page);
      }
    });
  }

  Future<void> _onRefresh() async {
    _partyListBloC.fetchPartyRefresh(0);
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
    PartyCreateBloc _partyCreateBloc = PartyCreateBloc();
    Map<String, dynamic> _partyInfo;
    Map<String, dynamic> _partyResualt;
    String _category;

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
                "상도동",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 127, 91, 255),
                ),
              ),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(CupertinoIcons.list_bullet),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () async {
              _category = await pushNewScreen(context,
                  screen: CategoryPage(), withNavBar: false);
              await pushNewScreen(context,
                  screen: PartySearchPage(
                    category: _category,
                  ),
                  withNavBar: false);
            },
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell),
            padding: const EdgeInsets.only(right: 15),
            onPressed: () =>
                pushNewScreen(context, screen: AlramPage(), withNavBar: false),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () => _onRefresh(),
        child: StreamBuilder<List<Content>>(
          stream: _partyListBloC.partyList,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _partyInfo = await pushNewScreen(context,
              screen: PartySigninPage(), withNavBar: false);
          print(_partyInfo);
          _partyResualt = await _partyCreateBloc.requestPartyCreate(_partyInfo);
          if (_partyResualt['statusCode'] == 200) {
            print('done');
          } else {
            print(_partyInfo['message']);
          }
        },
        backgroundColor: Color.fromARGB(255, 127, 91, 255),
        child: const Icon(Icons.add),
      ),
    );
  }
}
