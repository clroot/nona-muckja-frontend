import 'package:flutter/material.dart';
import 'package:nonamukja/blocs/auth/sigin_bloc.dart';
import 'package:nonamukja/model/auth/user_accessToken.dart';
import 'package:nonamukja/pages/navigation_control.dart';
import 'package:nonamukja/resources/service/storage_service.dart';
import 'package:nonamukja/widget/auth/login_dialog.dart';
import 'package:nonamukja/widget/auth/signin_dialog.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';

class UserManagePage extends StatefulWidget {
  @override
  State<UserManagePage> createState() => _UserManagePageState();
}

class _UserManagePageState extends State<UserManagePage> {
  UserSingInBloc _userSinginBloc = UserSingInBloc();
  StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });
  }

  _asyncMethod() async {
    //read 함수를 통하여 key값에 맞는 정보를 불러오게 됩니다. 이때 불러오는 결과의 타입은 String 타입임을 기억해야 합니다.
    //(데이터가 없을때는 null을 반환을 합니다.)
    Map<String, dynamic>? userInfo =
        await _storageService.readSecureData('token');

    //user의 정보가 있다면 바로 로그아웃 페이지로 넝어가게 합니다.
    if (userInfo['accessToken'] != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => ControlScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> _signinUserInfo;
    Map<String, dynamic> _singinResult;
    Map<String, dynamic> _loginResult;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 240, 245, 255),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.2),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 228, 236, 251),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 206, 219, 239),
                      offset: Offset(0, 20),
                      blurRadius: 25,
                    )
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 30),
                      child: GestureDetector(
                        onTap: () async {
                          _loginResult = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return LoginDialog();
                              });
                          if (_loginResult['statusCode'] == 200) {
                            await _storageService.writeSecureData(
                                UserAccessToken('token', _loginResult));
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ControlScreen(),
                              ),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  _loginResult['message'],
                                ),
                              ),
                            );
                          }
                        },
                        child: ClayWhiteButton(
                            content: '로그인', width: 130, height: 40),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () async {
                        _signinUserInfo = await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SignInDialog();
                            });
                        _singinResult = await _userSinginBloc
                            .requestUserSingIn(_signinUserInfo);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(_singinResult['message'])));
                      },
                      child: ClayPurpleButton(
                          content: '회원가입', width: 130, height: 40),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
