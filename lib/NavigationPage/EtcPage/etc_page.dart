import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nonamukja/NavigationPage/EtcPage/AdditionPage/regional_auth_page.dart';
import 'AdditionPage/notice_page.dart';
import 'AdditionPage/service_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'AdditionPage/regional_settings_page.dart';

class Profile_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          title: Text(
            '내정보',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: _buildProfile());
  }
}

class _buildProfile extends StatelessWidget {
  TextStyle boldStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18);
  TextStyle subStyle = TextStyle(color: Colors.grey, fontWeight: FontWeight.normal,fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Divider(height: 1),
            Card(
              elevation: 0.5,
              margin: EdgeInsets.only(bottom: 10),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 25,

                  backgroundImage: null,
                  backgroundColor: Colors.amberAccent,

                ),
                title: GestureDetector(
                  child: Text('User', style: boldStyle),
                  onTap: () {
                    print('TEST Tapped');
                  },
                ),
                subtitle: Text("example@naver.com"),
                trailing: const Icon(CupertinoIcons.chevron_forward),
              ),
            ),
            Divider(height: 1,),

            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Regional_Settings_Page(),
                    withNavBar: false
                ),
                leading: Icon(CupertinoIcons.location),
                title: Text('내 동네 설정'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Regional_Auth_Page(),
                    withNavBar: false
                ),
                  leading: Icon(CupertinoIcons.check_mark_circled),
                  title: Text('동네 인증하기'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Card(

              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                  context,
                  screen: Notice_Page(),
                  withNavBar: false
                ),
                  leading: Icon(Icons.announcement_outlined),
                  title: Text('공지사항'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Service_Page(),
                    withNavBar: false
                ),
                  leading: Icon(CupertinoIcons.envelope),
                  title: Text('고객센터'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Service_Page(),
                    withNavBar: false
                ),
                leading: Icon(Icons.settings_outlined),
                title: Text('설정'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Divider(height: 1,),

            Padding(padding: EdgeInsets.only(top:10)),

            Divider(height: 1,),
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Service_Page(),
                    withNavBar: false
                ),
                leading: Icon(Icons.description_outlined),
                title: Text('약관 및 정책'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),
            Card(
              margin: EdgeInsets.all(0),
              elevation: 0,
              child: ListTile(
                onTap: () => pushNewScreen(
                    context,
                    screen: Service_Page(),
                    withNavBar: false
                ),
                leading: Icon(Icons.info_outline),
                title: Text('버전 정보'),
                trailing: const Icon(CupertinoIcons.chevron_forward,size: 15,),

              ),
            ),


          ],
        ),
      ),
    );
  }
}