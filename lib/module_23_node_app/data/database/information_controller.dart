import 'package:shared_preferences/shared_preferences.dart';

class InformationController {
  List<String> list = [];

  /// 1st a  data set kora
  Future<void> setData(List<String> newList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('Info', newList);
  }

  /// get a khettre 1 ta parameter(Info) ney
  Future<void> getData() async {
    final prefs = await SharedPreferences.getInstance();
    list = prefs.getStringList('Info') ?? [];
  }
}
