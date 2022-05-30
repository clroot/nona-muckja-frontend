class UserLoginBloc {
  UserLoginRepository _userLoginRepository = UserLoginRepository();
  UserSinginProvieder _userSinginProvieder = UserSinginProvieder();

  Future<Map<String, dynamic>> requestUserLogin(
      String userName, String password) async {
    return await _userSinginProvieder.userLoginProvider(
        _userLoginRepository.setUserLoginRepository(userName, password));
  }
}
