import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_4/data/urls.dart';

class AddNewTaskController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;

  Future<bool> addNewTask(
    String title,
    String description,
    String status,
  ) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await NetworkCaller.postRequest(
      url: Urlss.createNewTaskUrl,
    );
    _inProgress = false;
    update();

    if (response.isSuccess) {
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMassage;
    }
    return isSuccess;
  }
}
