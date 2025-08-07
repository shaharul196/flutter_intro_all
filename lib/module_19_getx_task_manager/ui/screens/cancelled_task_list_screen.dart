import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager//ui/widget/centered_circular_progress_indicator.dart';
import 'package:ostad_flutter_sazu/module_19_getx_task_manager/ui/controllers/cancelled_task_list_controller.dart';
import '../widget/task_card.dart';
import 'package:get/get.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() =>
      _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {

  @override
  void initState() {
    super.initState();
    Get.find<CancelledTaskListController>().getCancelledTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Expanded(
          child: GetBuilder<CancelledTaskListController>(
            builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: CenteredCircularProgressIndicator(),
                child: ListView.builder(
                  itemCount: controller.cancelledTaskList.length,
                  itemBuilder: (context, index) {
                    return TaskCard(
                      taskType: TaskType.cancelled,
                      taskModel: controller.cancelledTaskList[index],
                      onStatusUpdate: () {
                        Get.find<CancelledTaskListController>().getCancelledTaskList();

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

