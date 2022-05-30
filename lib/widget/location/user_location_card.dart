import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:nonamukja/model/user/user_location_model.dart';

class UserLocationCard extends StatelessWidget {
  const UserLocationCard(
      {Key? key, required this.userLocationModel, required this.position})
      : super(key: key);

  final UserLocationModel? userLocationModel;
  final Position? position;
  @override
  Widget build(BuildContext context) {
    String roadAddress =
        userLocationModel!.documents!.first.roadAddress!.addressName.toString();
    String zipCode =
        userLocationModel!.documents!.first.roadAddress!.zoneNo.toString();
    String address =
        userLocationModel!.documents!.last.address!.addressName.toString();
    double x = position!.latitude;
    double y = position!.longitude;
    Map<String, dynamic> userLocation = {
      'roadAddress': roadAddress,
      'zipCode': zipCode,
      'address': address,
      'x': x,
      'y': y
    };
    return OutlinedButton(
      onPressed: () {
        Navigator.pop(context, userLocation);
      },
      child: Text(
        address,
      ),
    );
  }
}
