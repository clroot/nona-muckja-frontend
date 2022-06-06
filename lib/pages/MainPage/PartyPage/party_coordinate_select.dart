import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../widget/map/kakaomap_webview.dart';

String _apikey = dotenv.env['KAKAO_REST_API'].toString();

class PartyCoordinateSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> selectedLocation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Kakao map webview test')),
      body: KakaoMapView(
        width: size.width,
        height: 400,
        kakaoMapKey: _apikey,
        zoomLevel: 3,
        onTapMarker: (payload) async {
          selectedLocation = await jsonDecode(payload.message);
          Navigator.pop(context, selectedLocation);
        },
      ),
    );
  }
}
