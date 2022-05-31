import 'package:nonamukja/model/party/party_create.dart';

class PartyCreateRepository {
  PartyCreate setPartyRepository(Map<String, dynamic> partyInfo) {
    return PartyCreate.fromJson({
      'address': {
        'address': partyInfo['address'],
        'roadAddress': partyInfo['roadAddress'],
        'zipCode': partyInfo['zipCode'],
        'coordinate': {'latitude': partyInfo['x'], 'longitude': partyInfo['y']},
      },
      'limitMemberCount': partyInfo['limitMemberCount'],
      'partyTime': partyInfo['partyTime']
    });
  }
}
