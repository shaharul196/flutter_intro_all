import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/models/task_model.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/urls.dart';

class ProgressTaskListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<TaskModel> _progressTaskList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<TaskModel> get progressTaskList => _progressTaskList;

  Future<bool> getProgressTaskList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getProgressTaskUrl,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _progressTaskList = list;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage!;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
