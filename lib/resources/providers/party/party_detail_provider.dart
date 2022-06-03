import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/resources/service/storage_service.dart';
import 'package:nonamukja/model/party/party_detail_model.dart';

class PartyDetailProvieder {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<PartyDetailModel> partyDetailProvider(int? id) async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];

    final response = await client.get(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/party/$id"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return PartyDetailModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw token.toString();
    }
  }
}
