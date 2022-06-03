import 'dart:convert';

class UserAccessToken {
  UserAccessToken(String key, Object data) {
    this.key = key;
    this.data = jsonEncode(data);
  }

  late final String key;
  late final String data;
}
