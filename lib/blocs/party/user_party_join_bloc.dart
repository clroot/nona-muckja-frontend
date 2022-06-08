import 'dart:async';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/resources/repositories/party/party_list_repository.dart';
import 'package:nonamukja/resources/repositories/party/user_party_respository.dart';
import 'package:rxdart/rxdart.dart';

class UserPartyBloC {
  UserJoinPartyRepository _partyListRepository = UserJoinPartyRepository();

  final _userPartyFetcher = BehaviorSubject<List<Content>>();

  Stream<List<Content>> get userPartyList => _userPartyFetcher.stream;
  List<Content>? contentList = [];

  void fetchUserPartyList(int page) async {
    var tmp = await _partyListRepository.getPartyList();
    contentList = [...?contentList, ...?tmp];
    _userPartyFetcher.sink.add(contentList!);
  }

  void fetchPartyRefresh(int page) async {
    contentList!.clear();
    var tmp = await _partyListRepository.getPartyList();
    contentList = [...?contentList, ...?tmp];
    _userPartyFetcher.sink.add(contentList!);
  }

  dispose() {
    _userPartyFetcher.close();
  }
}
