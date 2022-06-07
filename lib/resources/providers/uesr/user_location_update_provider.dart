import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/model/user/user_location_update_model.dart';
import 'package:nonamukja/resources/service/storage_service.dart';

class UserLocationUpdateProvieder {
  Client client = Client();
  StorageService storageService = StorageService();

  String? userId;

  Future<String> userLocationUpdateProvider(
      UserLocationUpdateModel updateModel) async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];

    final response = await client.patch(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/user/profile"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(updateModel));

    if (response.statusCode == 200) {
      return "성공";
    } else {
      return "실패";
    }
  }
}
