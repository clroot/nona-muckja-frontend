import 'package:nonamukja/resources/providers/party/party_provider.dart';
import 'package:nonamukja/resources/repositories/party/party_repository.dart';

class PartyCreateBloc {
  PartyCreateProvieder _partyCreateProvieder = PartyCreateProvieder();
  PartyCreateRepository _partyCreateRepository = PartyCreateRepository();

  Future<Map<String, dynamic>> requestPartyCreate(
      Map<String, dynamic> partyInfo) async {
    return await _partyCreateProvieder.partyCreateProvieder(
        _partyCreateRepository.setPartyRepository(partyInfo));
  }
}
