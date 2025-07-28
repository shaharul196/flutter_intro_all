import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/data/models/task_model.dart';
import 'package:ostad_flutter_sazu/module_16/data/service/network_caller.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/snackbar_massage.dart';
import 'package:ostad_flutter_sazu/module_16/ui/widget/task_card.dart';
import '../../data/urls.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() =>
      _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {
  bool _getCompletedTasksInProgress = false;
  List<TaskModel> _CompletedTaskList = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _getCompletedTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Expanded(
          child: Visibility(
            visible: _getCompletedTasksInProgress == false,
            replacement: CenteredCircularProgressIndicator(),
            child: ListView.builder(
              itemCount: _CompletedTaskList.length,
              itemBuilder: (context, index) {
                return TaskCard(
                  taskType: TaskType.completed,
                  taskModel: _CompletedTaskList[index],
                  onStatusUpdate: () {
                    _getCompletedTaskList();
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getCompletedTaskList() async {
    _getCompletedTasksInProgress = true;
    setState(() {});

    NetworkResponse response = await NetworkCaller.getRequest(
      url: Urlss.getCompletedTaskUrl,
    );

    if (response.isSuccess) {
      List<TaskModel> list = [];
      for (Map<String, dynamic> jsonData in response.body!['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
      _CompletedTaskList = list;
    } else {
      if (mounted) {
        showSnackBarMassage(context, response.errorMassage!);
      }
    }

    _getCompletedTasksInProgress = false;
    setState(() {});
  }
}
