import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:nonamukja/resources/service/storage_service.dart';
import 'package:nonamukja/model/party/party_search_model.dart';
import 'package:nonamukja/model/party/party_list_model.dart';

class PartySearchProvider {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<PartyListModel> partySearchProvider(PartySearch partySearch) async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];

    final response = await client.post(
      Uri.parse("https://nona-muckja.clroot.io/api/v1/party/search"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode(partySearch),
    );

    if (response.statusCode == 200) {
      return PartyListModel.fromJson(
          json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw response.body;
    }
  }
}
