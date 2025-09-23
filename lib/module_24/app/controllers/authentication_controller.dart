import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/shared/data/models/user_model.dart';

class AuthenticationController {
  final String _tokenKey = 'access-token';
  final String _userDataKey = 'user-model';
  String? accessToken;
  UserModel? userModel;

  Future<void> saveUserData(UserModel model, String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, token);
    await sharedPreferences.setString(_userDataKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
  }

  Future<void> loadUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    accessToken = sharedPreferences.getString(_tokenKey);
    userModel = UserModel.fromJson(
      jsonDecode(sharedPreferences.getString(_userDataKey)!),
    );
  }

  Future<bool> isUserAlreadyLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString(_tokenKey);
    return token != null;
    // TODO if node
    // if(token != null){
    //   return true;
    // }else{
    //   return false;
    // }
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }
}
