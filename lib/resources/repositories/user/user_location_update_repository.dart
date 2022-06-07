import 'package:nonamukja/model/user/user_location_update_model.dart';

class UserLocationUpdateRepository {
  UserLocationUpdateModel setUserLocationRepository(
      Map<String, dynamic> userLocation) {
    return UserLocationUpdateModel.fromJson({
      'address': {
        'address': userLocation['address'],
        'roadAddress': userLocation['roadAddress'],
        'zipCode': userLocation['zipCode'],
        'coordinate': {
          'latitude': userLocation['x'],
          'longitude': userLocation['y']
        },
      }
    });
  }
}
