import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nonamukja/model/user/user_info.dart';

class UserInfoProvieder {
  Client client = Client();

  Future<UserInfo> userSinginProvider(String token) async {
    final response = await client.post(
        Uri.parse("http://127.0.0.1:8080/api/v1/user/profile"),
        headers: {'Authorization': 'Bearer {$token}'});
    if (response.statusCode == 200) {
      return UserInfo.fromJson(json.decode(response.body));
    } else {
      throw '유저 정보를 받아오지 못 하였습니다.';
    }
  }
}
