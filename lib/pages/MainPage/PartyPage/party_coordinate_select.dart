import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../widget/map/kakaomap_webview.dart';

String _apikey = dotenv.env['KAKAO_REST_API'].toString();

class PartyCoordinateSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text('Kakao map webview test')),
        body: KakaoMapView(
          width: size.width,
          height: 400,
          kakaoMapKey: _apikey,
          zoomLevel: 3,
          onTapMarker: (payload) {
            //TODO: JSON 디코딩 & 좌표 데이터 관리
            print(payload.message);
          },
        ));
  }
}
