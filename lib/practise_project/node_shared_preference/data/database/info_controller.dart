import 'package:shared_preferences/shared_preferences.dart';

class InformationController {
  List<String> list = [];

  Future<void> setData(List<String> newList) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setStringList('info', newList);
  }

  Future<void> getData() async {
    final preferences = await SharedPreferences.getInstance();
    list = preferences.getStringList('info') ?? [];
  }
}