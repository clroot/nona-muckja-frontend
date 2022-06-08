import 'dart:async';

import 'package:nonamukja/model/user/user_location_model.dart';
import 'package:nonamukja/resources/repositories/location/user_zipcode.dart';
import 'package:nonamukja/resources/providers/uesr/user_location_provider.dart';
import 'package:rxdart/rxdart.dart';

class UserLocationBloC {
  final _userLocationRepo = UserLocationDetailRepo();
  final _userLocationFetcher = BehaviorSubject<Map<String, dynamic>>();

  Stream<Map<String, dynamic>> get userLocationList =>
      _userLocationFetcher.stream;

  void fetchUserLocation() async {
    Map<String, dynamic> userLocationModel =
        await _userLocationRepo.fetchUserZipCode();
    _userLocationFetcher.sink.add(userLocationModel);
  }

  dispose() {
    _userLocationFetcher.close();
  }
}

class SelectedLocationBloC {
  final _selectedLocationProvider = UserLocationProvieder();
  final _selectedLocationFetcher = BehaviorSubject<UserLocationModel>();

  Stream<UserLocationModel> get selectedLocation =>
      _selectedLocationFetcher.stream;

  Future<UserLocationModel> fetchSelectedLocation(
      String lng, String lat) async {
    UserLocationModel userLocationModel =
        await _selectedLocationProvider.roadAddressProvieder(lng, lat);
    _selectedLocationFetcher.sink.add(userLocationModel);
    return userLocationModel;
  }

  dispose() {
    _selectedLocationFetcher.close();
  }
}
