import 'package:flutter/material.dart';

import '../widget/task_card.dart';

class CancelledTaskListScreen extends StatefulWidget {
  const CancelledTaskListScreen({super.key});

  @override
  State<CancelledTaskListScreen> createState() =>
      _CancelledTaskListScreenState();
}

class _CancelledTaskListScreenState extends State<CancelledTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // return TaskCard(taskType: TaskType.cancelled);
            },
          ),
        ),
      ),
    );
  }
}
