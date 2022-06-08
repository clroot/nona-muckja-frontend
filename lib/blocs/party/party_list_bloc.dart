import 'dart:async';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/resources/repositories/party/party_list_repository.dart';
import 'package:rxdart/rxdart.dart';

class PartyListBloC {
  PartyListRepository _partyListRepository = PartyListRepository();

  final _partyListFetcher = BehaviorSubject<List<Content>>();

  Stream<List<Content>> get partyList => _partyListFetcher.stream;

  List<Content>? contentList = [];

  void fetchPartyList(int page) async {
    var tmp = await _partyListRepository.getPartyList(page);
    contentList = [...?contentList, ...?tmp];
    _partyListFetcher.sink.add(contentList!);
  }

  void fetchPartyRefresh(int page) async {
    contentList!.clear();
    var tmp = await _partyListRepository.getPartyList(page);
    contentList = [...?contentList, ...?tmp];
    _partyListFetcher.sink.add(contentList!);
  }

  dispose() {
    _partyListFetcher.close();
  }
}
