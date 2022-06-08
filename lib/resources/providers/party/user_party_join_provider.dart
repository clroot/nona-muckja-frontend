import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/resources/service/storage_service.dart';
import 'package:nonamukja/model/party/party_list_model.dart';

class UserJoinPartyProvieder {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<PartyListModel> userJoinPartyProvieder() async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];
    int? userId = userInfo['userId'];

    final response = await client.get(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/user/$userId/party"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return PartyListModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw token.toString();
    }
  }
}
