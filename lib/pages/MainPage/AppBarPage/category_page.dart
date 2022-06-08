import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            '카테고리 검색',
            style: TextStyle(color: Color.fromARGB(255, 127, 91, 255)),
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
          CategoryContainer(title: '일식'),
          CategoryContainer(title: '중식'),
          CategoryContainer(title: '치킨'),
          CategoryContainer(title: '백반,죽'),
          CategoryContainer(title: '디저트'),
          CategoryContainer(title: '분식'),
          CategoryContainer(title: '찜,탕,찌개'),
          CategoryContainer(title: '피자'),
          CategoryContainer(title: '양식'),
          CategoryContainer(title: '고기구이'),
          CategoryContainer(title: '족발,보쌈'),
          CategoryContainer(title: '아시안'),
          CategoryContainer(title: '패스트푸드'),
          CategoryContainer(title: '도시락'),
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context, this.title);
      },
      title: Text(
        this.title,
        style: TextStyle(color: Colors.black),
      ),
      trailing: const Icon(
        CupertinoIcons.chevron_forward,
        size: 15,
      ),
    );
  }
}
