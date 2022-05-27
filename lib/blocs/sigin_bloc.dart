import 'package:rxdart/rxdart.dart';
import 'package:nonamukja/resources/repositories/auth/singin_repository.dart';
import 'package:nonamukja/resources/providers/auth/user_singin_provider.dart';

class UserSinginBloc {
  UserSinginRepository _userSinginRepository = UserSinginRepository();
  UserSinginProvieder _userSinginProvieder = UserSinginProvieder();

  Future<String> requestUserSingin(
      Map<String, dynamic> userLocationRepo) async {
    String sendRequest = await _userSinginProvieder.userSinginProvider(
        _userSinginRepository.setUserRepository(userLocationRepo));
    return sendRequest;
  }
}
