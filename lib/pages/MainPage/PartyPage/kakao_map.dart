import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:kakaomap_webview/src/kakaomap_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String _apikey = dotenv.env['KAKAO_REST_API'].toString();

class KakaoMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('Kakao map webview test')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
                child: Text('Kakao map screen'),
                onPressed: () async {
                  await _openKakaoMapScreen(context);
                })
          ],
        ),
      ),
    );
  }

  Future<void> _openKakaoMapScreen(BuildContext context) async {
    KakaoMapUtil util = KakaoMapUtil();
    String url =
        await util.getMapScreenURL(37.402056, 127.108212, name: 'Kakao 본사');

    Navigator.push(
        context, MaterialPageRoute(builder: (_) => KakaoMapScreen(url: url)));
  }
}
