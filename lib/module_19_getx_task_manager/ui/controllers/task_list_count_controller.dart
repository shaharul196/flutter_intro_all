import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/urls.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//data/models/task_status_count_model.dart';

class TaskListCountController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<TaskStatusCountModel> _taskStatusCountList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<TaskStatusCountModel> get taskStatusCountList => _taskStatusCountList;

  Future<bool> getTaskCountList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getTaskStatusCountUrl,
    );

    if (response.isSuccess) {
      List<TaskStatusCountModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskStatusCountModel.fromJson(jsonData));
      }
      _taskStatusCountList = list;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }

    _inProgress = false;
    update();

    return isSuccess;
  }
}
