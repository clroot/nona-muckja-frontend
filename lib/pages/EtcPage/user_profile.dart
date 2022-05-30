import 'dart:developer';

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

            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                Padding(padding: EdgeInsets.only(bottom: 20)),
                Container(
                  height: MediaQuery.of(context).size.height * 0.23,
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 127, 91, 255),
                    borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 188, 200, 218),
                          offset: Offset(0, 3),
                          blurRadius: 4,
                        )
                      ]
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("똥수",style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'MinSans-Medium',
                            color: Colors.white),),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        Icon(Icons.location_on,color: Colors.white,size: 30,),
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text("강원도 홍천군 홍천 길마곡리 14",style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'MinSans-Medium',
                            color: Colors.white),

                        ),




                      ],
                    ),
                ),
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
