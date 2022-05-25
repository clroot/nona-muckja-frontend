import 'package:flutter/material.dart';
import 'package:nonamukja/blocs/user_location_bloc.dart';
import 'package:nonamukja/model/user_location_model.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocationSetting extends StatefulWidget {
  UserLocationSetting({Key? key}) : super(key: key);

  @override
  State<UserLocationSetting> createState() => _UserLocationSettingState();
}

class _UserLocationSettingState extends State<UserLocationSetting> {
  Future<bool> permissionServices() async {
    PermissionStatus statuses = await Permission.location.request();

    if (statuses.isGranted) {
      return Future.value(true);
    } else {
      openAppSettings();
      return Future.value(false);
    }
  }

  Future<bool> permissionCheck() async {
    bool statuses = await Permission.location.isGranted;

    if (statuses) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  final _userLocationBloC = UserLocationBloC();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '위치 설정',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'MinSans-Medium',
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Text(
              '주변의 파티를 찾아 드려요!',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'MinSans-Medium',
                color: Colors.grey,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            IconButton(
              onPressed: () {
                _userLocationBloC.fetchUserLocation();
              },
              icon: Icon(Icons.location_on_outlined),
              iconSize: 40,
              color: Color.fromARGB(255, 127, 91, 255),
            ),
            StreamBuilder(
              builder: ((context, AsyncSnapshot<UserLocationModel> snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.documents!.first.region1depthName
                      .toString());
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return Text(
                  '위치 찾기',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'MinSans-Medium',
                    color: Color.fromARGB(255, 127, 91, 255),
                  ),
                );
              }),
              stream: _userLocationBloC.userLocationList,
            ),
          ],
        ),
      ),
    );
  }
}
