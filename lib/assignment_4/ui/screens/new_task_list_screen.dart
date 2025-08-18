import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/task_list_count_controller.dart';
import '../controllers/new_task_list_controller.dart';
import '../widget/centered_circular_progress_indicator.dart';
import '../widget/task_card.dart';
import '../widget/task_count_summary_card.dart';
import 'add_new_task_screen.dart';
import 'package:get/get.dart';

class NewTaskListScreen extends StatefulWidget {
  const NewTaskListScreen({super.key});

  @override
  State<NewTaskListScreen> createState() => _NewTaskListScreenState();
}

class _NewTaskListScreenState extends State<NewTaskListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<NewTaskListController>().getNewTaskList();
      Get.find<TaskListCountController>().getTaskCountList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            SizedBox(height: 16),
            SizedBox(
              height: 100,
              child: GetBuilder<TaskListCountController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ListView.separated(
                      itemCount: controller.taskStatusCountList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return TaskCountSummaryCard(
                          title: controller.taskStatusCountList[index].id,
                          count: controller.taskStatusCountList[index].count,
                        );
                      },
                      separatorBuilder:
                          (context, index) => const SizedBox(width: 4),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GetBuilder<NewTaskListController>(
                builder: (controller) {
                  return Visibility(
                    visible: controller.inProgress == false,
                    replacement: CenteredCircularProgressIndicator(),
                    child: ListView.builder(
                      itemCount: controller.newTaskList.length,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          taskType: TaskType.tNew,
                          taskModel: controller.newTaskList[index],
                          onStatusUpdate: () {
                            Get.find<NewTaskListController>().getNewTaskList();
                            Get.find<TaskListCountController>()
                                .getTaskCountList();
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTapAddNewTaskButton,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onTapAddNewTaskButton() {
    Get.toNamed(AddNewTaskScreen.name);
  }
}
