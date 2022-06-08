import 'package:nonamukja/model/party/party_create_model.dart';

class PartyCreateRepository {
  PartyCreate setPartyRepository(Map<String, dynamic> partyInfo) {
    return PartyCreate.fromJson({
      'address': {
        'address': partyInfo['address'],
        'roadAddress': partyInfo['roadAddress'],
        'zipCode': partyInfo['zipCode'],
        'coordinate': {'latitude': partyInfo['x'], 'longitude': partyInfo['y']},
      },
      'title': partyInfo['title'],
      'foodCategory': partyInfo['foodCategory'],
      'limitMemberCount': partyInfo['limitMemberCount'],
      'partyTime': partyInfo['partyTime']
    });
  }
}
