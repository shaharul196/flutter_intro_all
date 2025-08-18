import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/models/task_model.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/urls.dart';

class NewTaskListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<TaskModel> _newTaskList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<TaskModel> get newTaskList => _newTaskList;

  Future<bool> getNewTaskList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getNewTaskUrl,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _newTaskList = list;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
