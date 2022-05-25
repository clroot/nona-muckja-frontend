import 'package:flutter/material.dart';

class ClayWhiteButton extends StatelessWidget {
  const ClayWhiteButton({
    Key? key,
    required this.content,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String content;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: this.width,
        height: this.height,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-0.1, -0.7),
                  end: Alignment(0.05, 1),
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 204, 220, 246),
                  ]),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 188, 200, 218),
                  offset: Offset(0, 20),
                  blurRadius: 25,
                )
              ]),
          child: Center(
              child: Text(
            this.content,
            style: TextStyle(
                fontSize: 17,
                fontFamily: 'MinSans-Medium',
                fontWeight: FontWeight.bold),
          )),
        ));
  }
}

class ClayPurpleButton extends StatelessWidget {
  const ClayPurpleButton({
    Key? key,
    required this.content,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String content;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-0.1, -0.7),
                end: Alignment(0.05, 1),
                colors: [
                  Color.fromARGB(255, 127, 91, 255),
                  Color.fromARGB(255, 70, 36, 194),
                ]),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 189, 172, 251),
                offset: Offset(0, 20),
                blurRadius: 25,
              )
            ]),
        child: Center(
          child: Text(
            this.content,
            style: TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontFamily: 'MinSans-Medium',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
