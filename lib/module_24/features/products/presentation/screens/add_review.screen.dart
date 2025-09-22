import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/review_screen.dart';

class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key});

  static const String name = '/add_review';

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
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
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                SizedBox(height: 8,),
                TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    hintText: 'Write Review',
                  ),
                ),
                SizedBox(height: 16,),
                FilledButton(onPressed: (){
                  Navigator.pushNamed(context, ReviewScreen.name);
                }, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
