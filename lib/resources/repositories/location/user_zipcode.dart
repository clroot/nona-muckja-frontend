import 'package:nonamukja/resources/providers/user/user_location_provider.dart';

class UserLocationDetailRepo {
  final userLocationProvider = UserLocationProvieder();

  Future<Map<String, dynamic>> fetchUserZipCode() =>
      userLocationProvider.zipCodeProvieder();
}
