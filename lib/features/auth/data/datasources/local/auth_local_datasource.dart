import 'dart:async';
import 'dart:convert';


import 'package:coco_explorer/core/data/utils/constants.dart';
import 'package:coco_explorer/features/auth/data/models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> signInUser(UserModel user);

  UserModel? getSignedInUser();

  void logout();

  void setFirstTimeLogged(bool firstTimeLogged);

  bool getIsFirstTimeLogged();



  StreamController<UserModel?> get authStatus;

  void dispose();
}

@LazySingleton(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  final StreamController<UserModel?> _authStatusStream =
      StreamController<UserModel?>.broadcast();

  AuthLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<void> signInUser(UserModel user) async {
    await sharedPreferences.setString(
      SharedPreferencesKeys.user,
      json.encode(user.toJson()),
    );
  }

  @override
  UserModel? getSignedInUser() {
    if (!sharedPreferences.containsKey(SharedPreferencesKeys.user)) return null;

    return UserModel.fromJson(
      json.decode(sharedPreferences.getString(SharedPreferencesKeys.user)!)
          as Map<String, dynamic>,
    );
  }

  @override
  void logout() {
    sharedPreferences.remove(SharedPreferencesKeys.user);
  }

  @override
  bool getIsFirstTimeLogged() {
    return sharedPreferences.getBool(SharedPreferencesKeys.isFirstTimeLogged) !=
        false;
  }

  @override
  void setFirstTimeLogged(bool firstTimeLogged) {
    sharedPreferences.setBool(
        SharedPreferencesKeys.isFirstTimeLogged, firstTimeLogged);
  }


  @override
  StreamController<UserModel?> get authStatus => _authStatusStream;

  @override
  @disposeMethod
  void dispose() {
    _authStatusStream.close();
  }
}
