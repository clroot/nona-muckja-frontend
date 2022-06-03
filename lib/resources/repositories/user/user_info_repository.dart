import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/resources/providers/user/user_info_provider.dart';

class UserInfoRepository {
  final userInfoProvider = UserInfoProvieder();

  Future<UserInfo> fetchUserInfo() => userInfoProvider.userInfoProvider();
}
