import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/resources/repositories/party/party_detail_repository.dart';

class PartyDetailBloc {
  PartyDetailRepository _partyDetailRepository = PartyDetailRepository();

  Future<PartyDetailModel> requestPartyDetail(int? id) async {
    return await _partyDetailRepository.getPartyDetail(id);
  }
}
