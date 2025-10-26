import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/total_review_and_add_section.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  static const String name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: Column(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.all(16),
                        color: Colors.white,
                        elevation: 3,
                        shadowColor: AppColors.themeColor.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                spacing: 8,
                                children: [
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey.shade200,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'Sazu Rana',
                                    style: TextTheme.of(
                                      context,
                                    ).bodyLarge?.copyWith(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          TotalReviewAndAddSection(),
        ],
      ),
    );
  }
}
