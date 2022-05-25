import 'package:geolocator/geolocator.dart';

class UserLocationRepository {
  Future<Position> currentUserLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
