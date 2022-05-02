import 'package:flutter/material.dart';
import 'package:nonamukja/pages/user_manage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(primary: Color.fromARGB(255, 127, 91, 255)),
      ),
      debugShowCheckedModeBanner: false,
      home: UserManagePage(),
    );
  }
}
