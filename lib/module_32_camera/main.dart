import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:ostad_flutter_sazu/module_32_camera/app.dart';

void main() {
  runApp(
      DevicePreview(
      enabled: false,
      builder: (context) => CameraSetup()));
}
