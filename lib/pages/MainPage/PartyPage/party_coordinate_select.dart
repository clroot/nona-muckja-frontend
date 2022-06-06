import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

import '../../../resources/repositories/location/user_location_repository.dart';
import '../../../widget/map/kakaomap_webview.dart';

String _apikey = dotenv.env['KAKAO_JS_API_KEY'].toString();

class PartyCoordinateSelect extends StatelessWidget {
  const PartyCoordinateSelect({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Position? location;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedLocation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('위치 설정')),
      body: Column(
        children: [
          KakaoMapView(
            width: size.width,
            height: MediaQuery.of(context).size.height * 0.8,
            kakaoMapKey: _apikey,
            zoomLevel: 3,
            longitude: location!.longitude,
            latitude: location!.latitude,
            onTapMarker: (payload) async {
              selectedLocation = await jsonDecode(payload.message);
              Navigator.pop(context, selectedLocation);
            },
          ),
          Text('핀을 눌러 위치를 설정하세요!',
              style: TextStyle(fontFamily: 'MinSans-Medium', fontSize: 20))
        ],
      ),
    );
  }
}
