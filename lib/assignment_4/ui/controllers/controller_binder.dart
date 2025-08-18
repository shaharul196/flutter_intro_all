import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/ChangePasswordController.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/SignUpController.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/add_new_task_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/cancelled_task_list_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/completed_task_list_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/forgot_password_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/new_task_list_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/pin_verification_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/progress_task_list_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/sign_in_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/task_list_count_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(SignInController());
    Get.put(NewTaskListController());
    Get.put(ProgressTaskListController());
    Get.put(CompletedTaskListController());
    Get.put(CancelledTaskListController());
    Get.put(ForgotPasswordController());
    Get.put(PinVerificationController());
    Get.put(ChangePasswordController());
    Get.put(SignUpController());
    Get.put(TaskListCountController());
    Get.put(AddNewTaskController());

  }

}