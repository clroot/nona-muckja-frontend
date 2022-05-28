import 'package:nonamukja/resources/repositories/auth/singin_repository.dart';
import 'package:nonamukja/resources/providers/auth/user_singin_provider.dart';

class UserSinginBloc {
  UserSinginRepository _userSinginRepository = UserSinginRepository();
  UserSinginProvieder _userSinginProvieder = UserSinginProvieder();

  Future<Map<String, dynamic>> requestUserSingin(
      Map<String, dynamic> userLocationRepo) async {
    return await _userSinginProvieder.userSinginProvider(
        _userSinginRepository.setUserRepository(userLocationRepo));
  }
}
