import 'dart:async';

import 'package:nonamukja/resources/repositories/user/user_info_repository.dart';
import 'package:nonamukja/model/user/user_info.dart';
import 'package:rxdart/rxdart.dart';

class UserProfileBloC {
  UserInfoRepository _userInfoRepository = UserInfoRepository();

  final _userInfoFetcher = PublishSubject<UserInfo>();

  Stream<UserInfo> get userInfoList => _userInfoFetcher.stream;

  void fetchUserInfo() async {
    UserInfo userLocationModel = await _userInfoRepository.fetchUserInfo();
    _userInfoFetcher.sink.add(userLocationModel);
  }

  dispose() {
    _userInfoFetcher.close();
  }
}
