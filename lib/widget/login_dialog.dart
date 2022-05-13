import 'package:flutter/material.dart';
import 'package:nonamukja/pages/navigation_controll.dart';
import 'package:nonamukja/widget/clay_button.dart';

class LoginDialog extends StatelessWidget {
  const LoginDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 127, 91, 255))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'email'))),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 127, 91, 255))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'password'),
                      obscureText: true)),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ControllScreen()),
                          (route) => false);
                    },
                    child:
                        ClayPurpleButton(content: '확인', width: 130, height: 40),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class SigninDialog extends StatelessWidget {
  const SigninDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: Container(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '회원가입',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'MinSans-Medium',
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    child: TextFormField(

                        decoration: InputDecoration(

                            prefixIcon: Icon(Icons.email),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 127, 91, 255)
                                )
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            labelText: 'email',
                            hintText: 'you@example.com',

                        ),
                      validator: (value) => validateEmail(value),


                    ),

                  )
              ),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 127, 91, 255))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'password'),
                      obscureText: true)),
              Container(
                  padding: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 127, 91, 255))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          labelText: 'password'),
                      obscureText: true)),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: GestureDetector(
                    onTap: () {},
                    child:
                        ClayPurpleButton(content: '확인', width: 130, height: 40),
                  ))
            ],
          ),
        ),
      ),

    );
  }
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value))
    return 'Enter a valid email address';
  else
    return null;
}

