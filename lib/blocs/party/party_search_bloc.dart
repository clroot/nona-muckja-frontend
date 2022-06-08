import 'dart:async';
import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/model/party/party_search_model.dart';
import 'package:nonamukja/resources/providers/party/party_search_provider.dart';
import 'package:nonamukja/resources/repositories/party/party_search_repository.dart';
import 'package:rxdart/rxdart.dart';

class PartySearchBloC {
  PartySearchRepository _partySearchRepository = PartySearchRepository();
  PartySearchProvider _partySearchProvider = PartySearchProvider();

  final _partySearchListFetcher = BehaviorSubject<List<Content>>();

  Stream<List<Content>> get partySearchList => _partySearchListFetcher.stream;

  List<Content>? contentList = [];

  void fetchPartyList(String category) async {
    var tmp = await _partySearchProvider.partySearchProvider(
        await _partySearchRepository.getPartySearchList(category));
    contentList = [...?contentList, ...?tmp.content];
    _partySearchListFetcher.sink.add(contentList!);
  }

  dispose() {
    _partySearchListFetcher.close();
  }
}
