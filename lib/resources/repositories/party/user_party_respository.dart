import 'package:nonamukja/model/party/party_list_model.dart';
import 'package:nonamukja/resources/providers/party/party_list_provider.dart';
import 'package:nonamukja/resources/providers/party/user_party_join_provider.dart';

class UserJoinPartyRepository {
  final partyListProvieder = UserJoinPartyProvieder();

  Future<List<Content>?> getPartyList() async {
    List<Content>? partyPage;
    await partyListProvieder.userJoinPartyProvieder().then((value) {
      partyPage = value.content;
    });
    return partyPage;
  }
}
