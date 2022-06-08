import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/resources/providers/uesr/user_location_update_provider.dart';
import 'package:nonamukja/resources/repositories/user/user_location_update_repository.dart';
import 'package:nonamukja/widget/etc/card.dart';
import 'package:nonamukja/pages/EtcPage/AdditionPage/logout_page.dart';
import 'package:nonamukja/blocs/user/user_profile_bloc.dart';
import 'package:nonamukja/pages/EtcPage/AdditionPage/regional_auth_page.dart';
import 'package:nonamukja/widget/etc/user_profile_card.dart';
import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/widget/location/user_location_setting.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  UserProfileBloC _userProfileBloC = UserProfileBloC();
  UserLocationUpdateProvieder _userLocationProvieder =
      UserLocationUpdateProvieder();

  UserLocationUpdateRepository _userLocationRepository =
      UserLocationUpdateRepository();
  @override
  void initState() {
    super.initState();
    _userProfileBloC.fetchUserInfo();
  }

  @override
  void setState(fn) {
    super.setState(fn);
    _userProfileBloC.fetchUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _userLocation;
    String resualt;
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
                StreamBuilder(
                  builder: ((context, AsyncSnapshot<UserInfo> snapshot) {
                    if (snapshot.hasData) {
                      return ProfileCard(
                        userRoad:
                            snapshot.data!.address!.roadAddress.toString(),
                        userName: snapshot.data!.username.toString(),
                      );
                    } else if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
                  stream: _userProfileBloC.userInfoList,
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
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
                              onTap: () async {
                                _userLocation = await showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return UserLocationSetting();
                                    });
                                resualt = await _userLocationProvieder
                                    .userLocationUpdateProvider(
                                        _userLocationRepository
                                            .setUserLocationRepository(
                                                _userLocation));
                                setState(() {});
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
