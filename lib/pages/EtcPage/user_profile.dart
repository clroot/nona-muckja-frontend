import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/widget/etc/card.dart';
import 'package:nonamukja/pages/EtcPage/AdditionPage/logout_page.dart';
import 'package:nonamukja/pages/EtcPage/AdditionPage/regional_auth_page.dart';

import '../../widget/location/user_location_setting.dart';
class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

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
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 188, 200, 218),
                                    offset: Offset(0, 3),
                                    blurRadius: 4,
                                  )
                                ]),
                            child: ListTile(
                              iconColor: Color.fromARGB(255, 127, 91, 255),
                              onTap: () {
                                showDialog(context: context, builder: (BuildContext context){
                                  return UserLocationSetting();
                                });
                              },
                              leading: Icon(Icons.location_on),
                              title: Text('내 동네',
                                  style:
                                      TextStyle(fontFamily: 'MinSans-Medium')),
                              trailing: const Icon(
                                CupertinoIcons.chevron_forward,
                                size: 15,
                              ),
                            ),
                          ),
                          EtcCard(
                              changePage: RegionalAuth_Page(),
                              content: '설정',
                              icon: Icons.settings),
                          EtcCard(
                              changePage: LogOutPage(),
                              content: '로그아웃',
                              icon: Icons.logout_outlined),
                        ]))
              ],
            )),
      ),
    );
  }
}
