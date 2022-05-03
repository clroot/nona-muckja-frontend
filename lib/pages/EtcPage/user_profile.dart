import 'package:flutter/material.dart';
import 'package:nonamukja/widget/card.dart';
import 'package:nonamukja/pages/EtcPage/AdditionPage/regional_auth_page.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 2,
            padding: EdgeInsets.only(top: 40),
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 240, 245, 255)),
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomCard(
                    changePage: RegionalAuth_Page(),
                    content: '동내 설정',
                    icon: Icons.location_on,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomCard(
                    changePage: RegionalAuth_Page(),
                    content: '설정',
                    icon: Icons.settings,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
