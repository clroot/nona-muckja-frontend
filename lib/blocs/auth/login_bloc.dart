import 'package:nonamukja/resources/providers/auth/user_login_provider.dart';
import 'package:nonamukja/resources/repositories/auth/login_repository.dart';

class UserLoginBloc {
  UserLoginRepository _userLoginRepository = UserLoginRepository();
  UserSingInProvider _userSingInProvider = UserSingInProvider();

  Future<Map<String, dynamic>> requestUserLogin(
      String userName, String password) async {
    return await _userSingInProvider.userLoginProvider(
        _userLoginRepository.setUserLoginRepository(userName, password));
  }
}
