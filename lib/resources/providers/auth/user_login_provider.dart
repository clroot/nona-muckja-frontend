import 'dart:convert';

import 'package:nonamukja/model/auth/login_model.dart';
import 'package:http/http.dart' show Client;

class UserSinginProvieder {
  Client client = Client();

  Future<Map<String, dynamic>> userLoginProvider(LoginModel loginModel) async {
    final response = await client.post(
        Uri.parse("http://127.0.0.1:8080/api/v1/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginModel));
    if (response.statusCode == 200) {
      return {
        'statusCode': response.statusCode,
        'accessToken': jsonDecode(response.body)['accessToken'],
        'message': '로그인 성공!'
      };
    } else {
      // 실패 메시지 출력
      final data = jsonDecode(response.body);
      print(data);
      return {'statusCode': response.statusCode, 'message': data['message']};
    }
  }
}
