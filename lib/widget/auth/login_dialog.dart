import 'package:flutter/material.dart';
import 'package:nonamukja/pages/navigation_controll.dart';
import 'package:nonamukja/blocs/auth/login_bloc.dart';
import 'package:nonamukja/resources/etc/user_info_validation.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  State<LoginDialog> createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _userName = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final UserLoginBloc _userLoginBloc = UserLoginBloc();
    Map<String, dynamic> _loginResualt;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '로그인',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'MinSans-Medium',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: _userName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 127, 91, 255))),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 91, 91))),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 255, 91, 91)),
                      ),
                      labelText: 'user',
                      hintText: 'user name',
                    ),
                    validator: (value) =>
                        _userName.text.isEmpty ? "이름을 입력해 주세요" : null,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.7,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    controller: _password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 127, 91, 255))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 91, 91))),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 91, 91))),
                        labelText: 'password'),
                    obscureText: true,
                    validator: (value) => validatePassword(value),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
                child: GestureDetector(
                  onTap: () async {
                    if (validatePassword(_password.text) == null &&
                        _userName.text.isNotEmpty) {
                      _loginResualt = await _userLoginBloc.requestUserLogin(
                          _userName.text, _password.text);
                      Navigator.pop(context, _loginResualt);
                    }
                  },
                  child:
                      ClayPurpleButton(content: '확인', width: 130, height: 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
