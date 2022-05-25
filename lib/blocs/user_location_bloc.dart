import 'dart:async';

import 'package:nonamukja/resources/repositories/location/user_zipcode.dart';
import 'package:nonamukja/model/user_location_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class UserLocationBloC {
  final _userLocationRepo = UserLocationDetailRepo();
  final _userLocationFetcher = BehaviorSubject<UserLocationModel>();

  Stream<UserLocationModel> get userLocationList => _userLocationFetcher.stream;

  void fetchUserLocation() async {
    UserLocationModel userLocationModel =
        await _userLocationRepo.fetchUserZipCode();
    _userLocationFetcher.sink.add(userLocationModel);
  }

  dispose() {
    _userLocationFetcher.close();
  }
}
