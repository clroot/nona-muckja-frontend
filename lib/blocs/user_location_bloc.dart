import 'dart:async';

import 'package:nonamukja/resources/repositories/location/user_zipcode.dart';
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
