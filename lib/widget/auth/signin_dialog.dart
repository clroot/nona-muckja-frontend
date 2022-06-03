import 'package:flutter/material.dart';
import 'package:nonamukja/widget/etc/clay_button.dart';
import 'package:nonamukja/resources/service/user_info_validation.dart';
import 'package:nonamukja/widget/location/user_location_setting.dart';

class SignInDialog extends StatelessWidget {
  const SignInDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _userName = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();
    Map<String, dynamic> _userSinginInfo;

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '회원가입',
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'MinSans-Medium',
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.only(top: 5)),
                Text(
                  '노나먹자에서 노나먹어 보아요!',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'MinSans-Medium',
                    color: Colors.grey,
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                            controller: _userName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 127, 91, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                labelText: 'name'),
                            validator: (value) =>
                                _userName.text.isEmpty ? "이름을 입력해 주세요" : null))),
                Container(
                    padding: EdgeInsets.only(top: 15),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                            controller: _email,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                      color:
                                          Color.fromARGB(255, 127, 91, 255))),
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
                              labelText: 'email',
                              hintText: 'you@example.com',
                            ),
                            validator: (value) => validateEmail(value)))),
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
                                        color:
                                            Color.fromARGB(255, 127, 91, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                labelText: 'password'),
                            obscureText: true,
                            validator: (value) => validatePassword(value)))),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                            controller: _confirmPassword,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 127, 91, 255))),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromARGB(255, 255, 91, 91))),
                                labelText: 'password'),
                            obscureText: true,
                            validator: (value) =>
                                validateConfirmPassword(value, _password.text)))),
                Container(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () async {
                      if (validateEmail(_email.text) == null &&
                          validatePassword(_password.text) == null &&
                          validateConfirmPassword(
                                  _confirmPassword.text, _password.text) ==
                              null) {
                        _userSinginInfo = await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return UserLocationSetting();
                          },
                        );
                        _userSinginInfo['userName'] = _userName.text;
                        _userSinginInfo['email'] = _email.text;
                        _userSinginInfo['password'] = _password.text;
                        Navigator.pop(context, _userSinginInfo);
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
      ),
    );
  }
}
