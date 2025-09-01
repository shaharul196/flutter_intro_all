import 'package:shared_preferences/shared_preferences.dart';

class InformationController {
  List<String> list = [];

  /// prothome a  data set kora
  Future<void> setData(List<String> newList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('Info', newList);
  }

  /// get er khettre 1 ta parameter(Info) ney
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    list = prefs.getStringList('Info') ?? [];
  }

  /// sob data clear kora
  Future<void> removeAllData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
