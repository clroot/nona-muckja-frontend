import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/party/party_create_model.dart';
import 'dart:convert';

import 'package:nonamukja/resources/service/storage_service.dart';

class PartyCreateProvider {
  StorageService storageService = StorageService();
  Client client = Client();

  Future<Map<String, dynamic>> partyCreateProvieder(
      PartyCreate partyCreate) async {
    Map<String, dynamic>? userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];
    final response = await client.post(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/party"),
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
