import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/cancelled_task_list_controller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/completed_task_list_controller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/new_task_list_controller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/progress_task_list_controller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/sign_in_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(NewTaskListController());
    Get.put(ProgressTaskListController());
    Get.put(CompletedTaskListController());
    Get.put(CancelledTaskListController());
  }

}