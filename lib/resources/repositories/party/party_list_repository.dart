import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/resources/providers/party/party_list_provider.dart';

class PartyListRepository {
  final partyListProvieder = PartyListProvieder();

  Future<List<Content>?> getPartyList(int page) async {
    List<Content>? partyPage;
    await partyListProvieder.partyListProvider(page).then((value) {
      partyPage = value.content;
    });
    return partyPage;
  }
}
