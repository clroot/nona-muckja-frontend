import 'package:nonamukja/model/auth/register_model.dart';

class UserSinginRepository {
  Autogenerated setUserRepository(Map<String, dynamic> userSigninInfo) {
    return Autogenerated.fromJson({
      'username': userSigninInfo['userName'],
      'email': userSigninInfo['email'],
      'password': userSigninInfo['password'],
      'address': {
        'address': userSigninInfo['address'],
        'roadAddress': userSigninInfo['roadAddress'],
        'zipCode': userSigninInfo['zipCode'],
        'coordinate': {
          'latitude': userSigninInfo['x'],
          'longitude': userSigninInfo['y']
        },
      },
    });
  }
}
