import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:nonamukja/resources/repositories/location/user_location_repository.dart';
import 'package:nonamukja/model/user_location_model.dart';

class UserLocationProvieder {
  Client client = Client();
  String _apikey = 'e66748e75ec78bc0a16ba22b7295c9c2';
  UserLocationRepository userLocationRepository = UserLocationRepository();

  Future<UserLocationModel> zipCodeProvieder() async {
    Position position = await userLocationRepository.currentUserLocation();

    print(position.longitude);
    print(position.latitude);
    final response = await client.get(
        Uri.parse(
            "https://dapi.kakao.com/v2/local/geo/coord2regioncode.json?x=${position.longitude}&y=${position.latitude}"),
        headers: {'Authorization': 'KakaoAK ${_apikey}'});
    print(response.body.toString());
    if (response.statusCode == 200) {
      // 성공시 Address json 반환
      return UserLocationModel.fromJson(json.decode(response.body));
    } else {
      // 실패 메시지 출력
      throw Exception('위치를 받아오지 못 하였습니다.');
    }
  }
}
