import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/resources/service/storage_service.dart';

class UserInfoProvieder {
  Client client = Client();
  StorageService storageService = StorageService();

  Future<UserInfo> userInfoProvider() async {
    String? token = await storageService.readSecureData('token');

    final response = await client
        .get(Uri.parse("https://nona-muckja.clroot.io/api/v1/user"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return UserInfo.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw token.toString();
    }
  }
}
