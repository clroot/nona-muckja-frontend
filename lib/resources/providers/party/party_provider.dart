import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/party/party_create.dart';
import 'dart:convert';

import 'package:nonamukja/resources/service/storage_service.dart';

class PartyCreateProvieder {
  StorageService storageService = StorageService();
  Client client = Client();

  Future<Map<String, dynamic>> partyCreateProvieder(
      PartyCreate partyCreate) async {
    String? token = await storageService.readSecureData('token');
    final response =
        await client.post(Uri.parse("http://127.0.0.1:8080/api/v1/party"),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              'Authorization': 'Bearer $token'
            },
            body: jsonEncode(partyCreate));
    if (response.statusCode == 201) {
      // 성공 메시지
      return {'statusCode': response.statusCode, 'message': '성공!'};
    } else {
      // 실패 메시지 출력
      throw Exception('파티를 생성하지 못 하였습니다.');
    }
  }
}
