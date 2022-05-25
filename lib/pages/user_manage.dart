import 'package:flutter/material.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';
import 'package:nonamukja/widget/auth/login_dialog.dart';
import 'package:nonamukja/widget/auth/signin_dialog.dart';

class UserManagePage extends StatefulWidget {
  @override
  State<UserManagePage> createState() => _UserManagePageState();
}

class _UserManagePageState extends State<UserManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return LoginDialog();
                              });
                        },
                        child: ClayWhiteButton(
                            content: '로그인', width: 130, height: 40),
                      )),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return SigninDialog();
                            });
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
