import 'package:nonamukja/model/party/party_detail_model.dart';
import 'package:nonamukja/resources/providers/party/party_detail_provider.dart';

class PartyDetailRepository {
  final partDetailProvider = PartyDetailProvieder();

  Future<PartyDetailModel> getPartyDetail(int? id) async {
    return await partDetailProvider.partyDetailProvider(id);
  }
}
