import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecommandPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: false,
              title: Text(
                '추천',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.white,
            ),
            body: _buildGrid()),
      ),
    );
  }
}

Widget _buildGrid() => GridView.count(
      crossAxisCount: 4,
      padding: const EdgeInsets.all(1),
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      children: [
        Image.network("https://randomuser.me/api/portraits/men/16.jpg"),
        Image.network("https://randomuser.me/api/portraits/men/16.jpg"),
        Image.network("https://randomuser.me/api/portraits/men/16.jpg"),
        Image.network("https://randomuser.me/api/portraits/men/16.jpg"),
        Image.network("https://randomuser.me/api/portraits/men/16.jpg"),
      ],
    );
