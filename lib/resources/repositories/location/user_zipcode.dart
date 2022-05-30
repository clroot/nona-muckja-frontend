import 'package:nonamukja/resources/providers/uesr/user_location_provider.dart';

class UserLocationDetailRepo {
  final userLocationProvieder = UserLocationProvieder();

  Future<Map<String, dynamic>> fetchUserZipCode() =>
      userLocationProvieder.zipCodeProvieder();
}
