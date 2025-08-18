import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/completed_task_list_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/task_card.dart';

class CompletedTaskListScreen extends StatefulWidget {
  const CompletedTaskListScreen({super.key});

  @override
  State<CompletedTaskListScreen> createState() =>
      _CompletedTaskListScreenState();
}

class _CompletedTaskListScreenState extends State<CompletedTaskListScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<CompletedTaskListController>().getCompletedTaskList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Expanded(
          child: GetBuilder<CompletedTaskListController>(
            builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: CenteredCircularProgressIndicator(),
                child: ListView.builder(
                  itemCount: controller.completedTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskType: TaskType.completed,
                      taskModel: controller.completedTaskList[index],
                      onStatusUpdate: () {
                        Get.find<CompletedTaskListController>().getCompletedTaskList();
                      },
                    );
                  },
                ),
              );
            }
          ),
        ),
      ),
    );
  }
}

