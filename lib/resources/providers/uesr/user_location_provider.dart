import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import 'package:nonamukja/resources/repositories/location/user_location_repository.dart';
import 'package:nonamukja/model/user/user_location_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class UserLocationProvieder {
  Client client = Client();
  UserLocationRepository userLocationRepository = UserLocationRepository();

  String? apikey = dotenv.env['KAKAO_REST_API'];
  Future<Map<String, dynamic>> zipCodeProvieder() async {
    Position position = await userLocationRepository.currentUserLocation();

    final response = await client.get(
        Uri.parse(
            "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=${position.longitude}&y=${position.latitude}"),
        headers: {'Authorization': 'KakaoAK $apikey'});
    if (response.statusCode == 200) {
      // 성공시 Address json 반환
      Map<String, dynamic> userLocation = {
        'userLocation': UserLocationModel.fromJson(json.decode(response.body)),
        'position': position
      };
      return userLocation;
    } else {
      // 실패 메시지 출력
      throw Exception('위치를 받아오지 못 하였습니다.');
    }
  }

  Future<UserLocationModel> roadAddressProvieder(lng, lat) async {
    final response = await client.get(
        Uri.parse(
            "https://dapi.kakao.com/v2/local/geo/coord2address.json?x=$lng&y=$lat"),
        headers: {'Authorization': 'KakaoAK $apikey'});
    if (response.statusCode == 200) {
      // 성공시 Address json 반환
      return UserLocationModel.fromJson(json.decode(response.body));
    } else {
      // 실패 메시지 출력
      throw Exception('위치를 받아오지 못 하였습니다.');
    }
  }
}
