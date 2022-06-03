import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/resources/service/storage_service.dart';

class PartyJoinProvider {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<Map<String, dynamic>> partyJoinProvider(int? id) async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];

    final response = await client.post(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/party/$id/join"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return {'status': response.statusCode};
    } else {
      return {
        'status': response.statusCode,
        'message': utf8.decode(response.bodyBytes)
      };
    }
  }
}
