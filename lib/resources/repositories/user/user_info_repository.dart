import 'package:nonamukja/model/user/user_info.dart';
import 'package:nonamukja/resources/providers/uesr/user_info_provider.dart';

class UserInfoRepository {
  final userInfoProvieder = UserInfoProvieder();

  Future<UserInfo> fetchUserInfo() => userInfoProvieder.userInfoProvider();
}
