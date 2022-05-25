import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import 'package:nonamukja/model/user_location_model.dart';

class UserLocationCard extends StatelessWidget {
  const UserLocationCard({Key? key, required this.userLocationModel})
      : super(key: key);

  final UserLocationModel? userLocationModel;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: RichText(
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: [
            TextSpan(
                text: userLocationModel!.documents!.last.region1depthName
                        .toString() +
                    " "),
            TextSpan(
                text: userLocationModel!.documents!.last.region2depthName
                        .toString() +
                    " "),
            TextSpan(
                text: userLocationModel!.documents!.last.region3depthName
                        .toString() +
                    " "),
          ],
        ),
      ),
    );
  }
}
