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
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                Padding(padding: EdgeInsets.only(bottom: 40)),
                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          EtcCard(
                            changePage: RegionalAuth_Page(),
                            content: '동내 설정',
                            icon: Icons.location_on,
                          ),
                          EtcCard(
                              changePage: RegionalAuth_Page(),
                              content: '설정',
                              icon: Icons.settings),
                          EtcCard(
                              changePage: RegionalAuth_Page(),
                              content: '설정',
                              icon: Icons.settings),
                          EtcCard(
                              changePage: RegionalAuth_Page(),
                              content: '설정',
                              icon: Icons.settings),
                        ]))
              ],
            )),
      ),
    );
  }
}
