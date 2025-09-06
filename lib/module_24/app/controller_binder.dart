import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainNavController());
  }

}