import 'package:flutter/material.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';
import 'package:nonamukja/resources/service/storage_service.dart';
import 'package:nonamukja/pages/user_manage.dart';

class LogOutPage extends StatefulWidget {
  @override
  State<LogOutPage> createState() => _LogOutPageState();
}

class _LogOutPageState extends State<LogOutPage> {
  StorageService _storageService = StorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromARGB(255, 127, 91, 255)),
          elevation: 0.0,
          centerTitle: false,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '로그아웃',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'MinSans-Medium',
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 127, 91, 255)),
              ),
              Padding(padding: EdgeInsets.only(top: 5)),
              Text(
                '로그아웃 하시겠습니까?',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'MinSans-Medium',
                  color: Colors.grey,
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 30)),
              GestureDetector(
                child: ClayPurpleButton(content: '확인', width: 100, height: 45),
                onTap: () async {
                  await _storageService.deleteSecureData('token').then(
                    (value) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => UserManagePage(),
                        ),
                        (route) => false,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ));
  }
}
