import 'dart:convert';
import 'package:nonamukja/model/auth/login_model.dart';
import 'package:http/http.dart' show Client;

class UserSingInProvider {
  Client client = Client();

  Future<Map<String, dynamic>> userLoginProvider(LoginModel loginModel) async {
    final response = await client.post(
        Uri.parse("https://nona-muckja.clroot.io/api/v1/auth/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(loginModel));

    if (response.statusCode == 200) {
      return {
        'statusCode': response.statusCode,
        'userId': jsonDecode(response.body)['userId'],
        'accessToken': jsonDecode(response.body)['accessToken'],
        'message': '로그인 성공!'
      };
    } else {
      // 실패 메시지 출력
      final data = jsonDecode(response.body);
      return {
        'statusCode': response.statusCode,
        'message': utf8.decode(data['message'])
      };
    }
  }
}
