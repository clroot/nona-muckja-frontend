import 'package:nonamukja/resources/repositories/auth/login_repository.dart';
import 'package:nonamukja/resources/providers/auth/user_login_provider.dart';

class UserLoginBloc {
  UserLoginRepository _userLoginRepository = UserLoginRepository();
  UserSinginProvieder _userSinginProvieder = UserSinginProvieder();

  Future<Map<String, dynamic>> requestUserLogin(
      String userName, String password) async {
    return await _userSinginProvieder.userLoginProvider(
        _userLoginRepository.setUserLoginRepository(userName, password));
  }
}
