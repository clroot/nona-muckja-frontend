import 'package:nonamukja/resources/providers/auth/user_singin_provider.dart';
import 'package:nonamukja/resources/repositories/auth/singin_repository.dart';

class UserSingInBloc {
  UserSingInRepository _userSingInRepository = UserSingInRepository();
  UserSingInProvider _userSingInProvider = UserSingInProvider();

  Future<Map<String, dynamic>> requestUserSingIn(
      Map<String, dynamic> userLocationRepo) async {
    return await _userSingInProvider.userSinginProvider(
        _userSingInRepository.setUserRepository(userLocationRepo));
  }
}
