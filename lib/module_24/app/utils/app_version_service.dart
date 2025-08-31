import 'package:package_info_plus/package_info_plus.dart';

class AppVersionService {
  static String? _currentVersion;

  static Future<void> getCurrentAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _currentVersion= packageInfo.version;
  }

  static String get currentVersion => _currentVersion ?? '';
}