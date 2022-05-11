import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nonamukja/pages/MainPage/AppBarPage/alram_page.dart';
import 'package:nonamukja/widget/card.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '카테고리',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: BuildCategoryPage());
  }
}

class BuildCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(changePage: AlramPage(), content: '치킨'),
            CategoryCard(changePage: AlramPage(), content: '치킨'),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(changePage: AlramPage(), content: '치킨'),
            CategoryCard(changePage: AlramPage(), content: '치킨'),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CategoryCard(changePage: AlramPage(), content: '치킨'),
            CategoryCard(changePage: AlramPage(), content: '치킨'),

          ],
        )
      ],
    ));
  }
}
