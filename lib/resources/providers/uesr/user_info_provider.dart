import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/resources/service/storage_service.dart';

class UserInfoProvieder {
  Client client = Client();
  StorageService storageService = StorageService();
  String? userId;

  Future<UserInfo> userInfoProvider() async {
    Map<String, dynamic> userInfo =
        await storageService.readSecureData('token');
    String? token = userInfo['accessToken'];
    int? userId = userInfo['userId'];

    final response = await client.get(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/user/$userId"),
        headers: {
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
