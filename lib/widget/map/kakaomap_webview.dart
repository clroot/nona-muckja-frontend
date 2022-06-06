import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoMapView extends StatelessWidget {
  final String kakaoMapKey;
  final double width;
  final double height;
  final double latitude;
  final double longitude;
  final int zoomLevel;
  final void Function(JavascriptMessage)? onTapMarker;
  final void Function(WebViewController)? mapController;
  final GlobalKey? mapWidgetKey;

  const KakaoMapView({
    required this.kakaoMapKey,
    required this.width,
    required this.height,
    required this.latitude,
    required this.longitude,
    this.zoomLevel = 3,
    this.onTapMarker,
    this.mapController,
    this.mapWidgetKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: mapWidgetKey,
      height: height,
      width: width,
      child: WebView(
        initialUrl: _getKakaoMapUrl(),
        onWebViewCreated: mapController,
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: _getChannels,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        ].toSet(),
      ),
    );
  }

  Set<JavascriptChannel>? get _getChannels {
    Set<JavascriptChannel>? channels = {};
    if (onTapMarker != null) {
      channels.add(JavascriptChannel(
          name: 'onTapMarker', onMessageReceived: onTapMarker!));
    }
    return channels;
  }

  String _getKakaoMapUrl() {
    String html = '''
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title></title>
</head>

<body>
<div id="map" style="width:100vw;height:100vh;"></div>
<div id="clickLatlng"></div>
<script type="text/javascript"
        src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=$kakaoMapKey"></script>
<script>
    let coordinate = {
        lat: $latitude,
        lng: $longitude
    };
    const mapContainer = document.getElementById('map');
    const mapOption = {
        center: new kakao.maps.LatLng(coordinate.lat, coordinate.lng),
        level: $zoomLevel
    };

    const map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

    const marker = new kakao.maps.Marker({
        position: map.getCenter()
    });

    marker.setMap(map);

    kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
        const payload = mouseEvent.latLng;
        marker.setPosition(payload);

        coordinate.lat = payload.getLat();
        coordinate.lng = payload.getLng();

        console.log(coordinate)
    });

    if (${onTapMarker == null}) {
      var onTapMarker = {
          postMessage: (payload) => {
              console.log(payload.lat);
          }
      }
    }
    const infoWindowContent = `
<div style="padding:5px; display: block">
    <span>현재 위치에서 파티를 생성하시겠습니까?</span>
    <button onclick="onTapMarker.postMessage(JSON.stringify(coordinate))" style="display: inline">확인</button>
    <br>
    <br>
</div>
    `.trim();
    const isInfoWindowRemovable = true;

    const infoWindow = new kakao.maps.InfoWindow({
        content: infoWindowContent,
        removable: isInfoWindowRemovable
    });

    kakao.maps.event.addListener(marker, 'click', function () {
        // 마커 위에 인포윈도우를 표시합니다
        infoWindow.open(map, marker);
    });
</script>
</body>

</html>
    '''
        .trim();
    return Uri.dataFromString(html,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString();
  }
}
