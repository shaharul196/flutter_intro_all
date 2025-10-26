import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/controllers/add_review_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/data/models/add_review_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/screens/review_screen.dart';
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
  final AddReviewController _addReviewController = Get.find<AddReviewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Reviews'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16,),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write Review',
                  ),
                ),
                SizedBox(height: 16,),
                GetBuilder<AddReviewController>(
                  builder: (controller) {
                    return Visibility(
                      visible: controller.addReviewInProgress == false,
                      replacement: CenteredCircularProgress(),
                      child: FilledButton(onPressed: (){
                        _onTapSubmitButton();
                      }, child: Text('Submit')),
                    );
                  }
                ),
              ],
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

  void _onTapSubmitButton(){
    Navigator.pushNamed(context, ReviewScreen.name);
    _getAddReview();
  }

  Future<void> _getAddReview() async  {
   AddReviewModel model = AddReviewModel(
       firstName: _firstNameController.text.trim(),
       lastName: _lastNameController.text.trim(),
       description: _descriptionController.text.trim(),
   );

   final bool isSuccess = await _addReviewController.getAddReview(model);
   if(isSuccess){
     shownSnackBarMessage(context, 'Added to review');
     Navigator.pushNamed(context, ReviewScreen.name);
   }else{
     shownSnackBarMessage(context, _addReviewController.errorMessage!);
   }
  }
}
