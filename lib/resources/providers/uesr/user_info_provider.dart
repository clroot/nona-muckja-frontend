import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/resources/service/storage_service.dart';

class UserInfoProvieder {
  Client client = Client();
  StorageService storageService = StorageService();
  String? token;

  Future<UserInfo> userInfoProvider() async {
    await storageService.readSecureData('token').then((value) {
      token = value;
    });
    final response = await client
        .get(Uri.parse("http://127.0.0.1:8080/api/v1/user"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    if (response.statusCode == 200) {
      return UserInfo.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      throw '유저 정보를 받아오지 못 하였습니다.';
    }
  }
}
