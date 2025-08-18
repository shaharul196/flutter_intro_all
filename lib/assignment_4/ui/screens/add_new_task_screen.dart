import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/controllers/add_new_task_controller.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/screen_background.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/snackbar_massage.dart';
import 'package:ostad_flutter_sazu/assignment_4/ui/widget/tm_app_bar.dart';
import '../widget/centered_circular_progress_indicator.dart';
import 'package:get/get.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key, required this.New});
  final String New;

  static const String name = '/add-new-task';

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddNewTaskController _addNewTaskController =
      Get.find<AddNewTaskController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TMAppBar(),
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                // spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text(
                    'Add New Task',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _titleTEController,
                    decoration: InputDecoration(hintText: 'Title'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your title';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionTEController,
                    maxLines: 6,
                    decoration: InputDecoration(hintText: 'Description'),
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your description';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 24),
                  GetBuilder<AddNewTaskController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.inProgress == false,
                        replacement: CenteredCircularProgressIndicator(),
                        child: ElevatedButton(
                          onPressed: _onTapSubmitButton,
                          child: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 25,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _addNewTask();
    }
  }

  Future<void> _addNewTask() async {
    final bool isSuccess = await _addNewTaskController.addNewTask(
      _titleTEController.text.trim(),
      _descriptionTEController.text.trim(),
      widget.New,
    );
    if (isSuccess) {
      _titleTEController.clear();
      _descriptionTEController.clear();
      if (mounted) {
        showSnackBarMassage(context, 'Added new task');
      }
    } else {
      if (mounted) {
        showSnackBarMassage(context, _addNewTaskController.errorMessage!);
      }
    }
  }

  @override
  void dispose() {
    _titleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
