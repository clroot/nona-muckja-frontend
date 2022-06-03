import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nonamukja/model/auth/user_accessToken.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(UserAccessToken userAccessToken) async {
    var key = userAccessToken.key;
    var data = userAccessToken.data;
    await _secureStorage.write(key: key, value: data);
  }

  Future<Map<String, dynamic>> readSecureData(String key) async {
    var payload = await _secureStorage.read(key: key);
    Map<String, dynamic> resualt = jsonDecode(payload.toString());
    return resualt;
  }

  Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<bool> containsKeyInSecureData(String key) async {
    var containsKey = await _secureStorage.containsKey(key: key);
    return containsKey;
  }

  Future<List<UserAccessToken>> readAllSecureData() async {
    var allData = await _secureStorage.readAll();
    List<UserAccessToken> list =
        allData.entries.map((e) => UserAccessToken(e.key, e.value)).toList();
    list.forEach((element) {
      print(element.key + " " + element.data);
    });
    return list;
  }

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll();
  }
}
