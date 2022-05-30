import 'dart:html';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/party/party_create.dart';
import 'dart:convert';

class UserLocationProvieder {
  Future<Map<String, dynamic>> zipCodeProvieder(
      String token, PartyCreate partyCreate) async {
    Client client = Client();

    final response = await client.post(
        Uri.parse("http://127.0.0.1:8080/api/v1/party"),
        headers: {
          "Content-Type": "application/json",
          'Authorization': 'Bearer {$token}'
        },
        body: jsonEncode(partyCreate));
    if (response.statusCode == 200) {
      // 성공 메시지
      return {'message': '성공!'};
    } else {
      // 실패 메시지 출력
      throw Exception('위치를 받아오지 못 하였습니다.');
    }
  }
}
