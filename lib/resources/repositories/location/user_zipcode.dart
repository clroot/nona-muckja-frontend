import 'package:nonamukja/resources/providers/user_location_provider.dart';
import 'package:nonamukja/model/user_location_model.dart';

class UserLocationDetailRepo {
  final userLocationProvieder = UserLocationProvieder();

  Future<UserLocationModel> fetchUserZipCode() =>
      userLocationProvieder.zipCodeProvieder();
}
