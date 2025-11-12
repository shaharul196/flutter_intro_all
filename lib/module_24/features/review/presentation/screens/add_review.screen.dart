import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/controllers/add_review_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/data/models/add_review_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/screens/review_list_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/snackbar_message.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static const String name = '/add_review';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AddReviewController _addReviewController =
      Get.find<AddReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Create Reviews')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _firstNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'First Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _lastNameController,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(hintText: 'Last Name'),
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: _descriptionController,
                    maxLines: 10,
                    decoration: InputDecoration(hintText: 'Write Review'),
                  ),
                  SizedBox(height: 16),
                  GetBuilder<AddReviewController>(
                    builder: (controller) {
                      return Visibility(
                        visible: controller.addReviewInProgress == false,
                        replacement: CenteredCircularProgress(),
                        child: FilledButton(
                          onPressed: () {
                            _onTapSubmitButton();
                          },
                          child: Text('Submit'),
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

  @override
  void dispose() {
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _descriptionController.dispose();
  }

  void _onTapSubmitButton() {
    if (_formKey.currentState!.validate()) {
      _getAddReview();
    }
  }

  Future<void> _getAddReview() async {
    final model = AddReviewModel(
      // productId: "679a06ad8ddf463f174f0df6",
      productId: "679a06ad8ddf463f174f0df6",
      comment: _descriptionController.text.trim(),
      rating: 4,
    );
    final bool isSuccess = await _addReviewController.getAddReview(model,);
    if (isSuccess) {
      final productId = _addReviewController.responseBody;
      Navigator.pushNamed(context, ReviewListScreen.name, arguments: productId);
      shownSnackBarMessage(context, 'Successfully added review');
    } else {
      shownSnackBarMessage(context, _addReviewController.errorMessage!);
    }
  }
}
