import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/NavigationPage/EtcPage/AdditionPage/regional_settings_page.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';



class Main_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0.0,
              centerTitle: false,
              title: Text(
                '홈',
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(CupertinoIcons.search),
                  padding: const EdgeInsets.only(right: 15),
                  onPressed: () => pushNewScreen(context,
                      screen: Regional_Settings_Page(), withNavBar: false),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.list_bullet),
                  padding: const EdgeInsets.only(right: 15),
                  onPressed: () => pushNewScreen(context,
                      screen: Regional_Settings_Page(), withNavBar: false),
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.bell),
                  padding: const EdgeInsets.only(right: 15),
                  onPressed: () => pushNewScreen(context,
                      screen: Regional_Settings_Page(), withNavBar: false),
                )

              ],
              backgroundColor: Colors.white,
            ),
            body: Stack(
             children: [

               Divider(height: 1)

             ],
            ),


            //floatingActionButton: ChangeNotifierProvider(create: (BuildContext context) => FilterProvider();
            //child: filter()),
        );
  }
}





