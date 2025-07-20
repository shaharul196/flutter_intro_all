import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_16/data/models/task_model.dart';

enum TaskType { tNew, progress, completed, cancelled }

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.taskType, required this.taskModel});
  // final String text;
  // final Color colors;

  final TaskType taskType;
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              taskModel.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(taskModel.description, style: TextStyle(color: Colors.black54)),
            Text('Date:${taskModel.createdDate}'),
            SizedBox(height: 8),
            Row(
              children: [
                Chip(
                  label: Text(_getTaskTypeName(), style: TextStyle(color: Colors.white)),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                    side: BorderSide.none,
                  ),
                  backgroundColor: _getTaskChipColor(),
                ),
                Spacer(),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getTaskChipColor() {
    // TODO if er maddome color set kora
    // if(taskType == TaskType.tNew){
    //   return Colors.blue;
    // }else if(taskType == TaskType.progress){
    //   return Colors.purple;
    // }else if(taskType == TaskType.completed){
    //   return Colors.green;
    // }else{
    //   return Colors.red;
    // }

    switch (taskType) {
      case TaskType.tNew:
        return Colors.blue;
      case TaskType.progress:
        return Colors.purple;
      case TaskType.completed:
        return Colors.green;
      case TaskType.cancelled:
        return Colors.red;
    }
  }

   String _getTaskTypeName(){
    switch(taskType){
      case TaskType.tNew:
        return 'New';
      case TaskType.progress:
        return 'Progress';
      case TaskType.completed:
       return 'Completed';
      case TaskType.cancelled:
        return 'Cancelled';
    }
  }

}
