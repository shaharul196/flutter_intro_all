import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_3/data/models/task_model.dart';
import 'package:ostad_flutter_sazu/assignment_3/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/assignment_3/data/urls.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/widget/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_sazu/assignment_3/ui/widget/snackbar_massage.dart';
import '../widget/task_card.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() =>
      _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {
  bool _getCancelledTasksInProgress = false;
  List<TaskModel> _CancelledTaskList = [];

  @override
  void initState() {
    super.initState();
    _getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Expanded(
          child: Visibility(
            visible: _getCancelledTasksInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: ListView.builder(
              itemCount: _CancelledTaskList.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskType: TaskType.cancelled,
                  taskModel: _CancelledTaskList[index],
                  onStatusUpdate: () {
                    _getCancelledTaskList();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCancelledTaskList() async {
    _getCancelledTasksInProgress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getCancelledTaskUrl,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _CancelledTaskList = list;
    } else {
      if (mounted) {
        showSnackBarMassage(context, response.errorMassage!);
      }
    }
    _getCancelledTasksInProgress = false;
    setState(() {});
  }
}
