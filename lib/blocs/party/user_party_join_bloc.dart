import 'dart:async';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/resources/repositories/party/party_list_repository.dart';
import 'package:rxdart/rxdart.dart';

class UserPartyBloC {
  PartyListRepository _partyListRepository = PartyListRepository();

  final _userPartyFetcher = BehaviorSubject<List<Content>>();

  Stream<List<Content>> get userPartyList => _userPartyFetcher.stream;
  List<Content>? contentList = [];

  void fetchUserPartyList(int page) async {
    var tmp = await _partyListRepository.getPartyList(page);
    contentList = [...?contentList, ...?tmp];
    _userPartyFetcher.sink.add(contentList!);
  }

  dispose() {
    _userPartyFetcher.close();
  }
}
