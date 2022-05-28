import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nonamukja/model/auth/user_accessToken.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeSecureData(UserAccessToken userAccessToken) async {
    await _secureStorage.write(
        key: userAccessToken.key, value: userAccessToken.value);
  }

  Future<String?> readSecureData(String key) async {
    var readData = await _secureStorage.read(key: key);
    return readData;
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
      print(element.key + " " + element.value);
    });
    return list;
  }

  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll();
  }
}
