import 'package:nonamukja/resources/providers/party/party_provider.dart';
import 'package:nonamukja/resources/repositories/party/party_create_repository.dart';

class PartyCreateBloc {
  PartyCreateProvider _partyCreateProvider = PartyCreateProvider();
  PartyCreateRepository _partyCreateRepository = PartyCreateRepository();

  Future<Map<String, dynamic>> requestPartyCreate(
      Map<String, dynamic> partyInfo) async {
    return await _partyCreateProvider.partyCreateProvieder(
        _partyCreateRepository.setPartyRepository(partyInfo));
  }
}
