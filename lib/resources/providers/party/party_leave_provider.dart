import 'package:http/http.dart' show Client;
import 'package:nonamukja/resources/service/storage_service.dart';

class PartyLeaveProvieder {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<String> partyLeaveProvieder(int? id) async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];

    final response = await client.post(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/party/$id/leave"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    if (response.statusCode == 200) {
      return "성공";
    } else {
      return response.body;
    }
  }
}
