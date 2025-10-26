import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/widgets/total_review_and_add_section.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/controllers/review_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  static const String name = '/review-screen';

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final ReviewController _reviewController = Get.find<ReviewController>();

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
                  child: GetBuilder(
                    init: _reviewController,
                    builder: (controller) {
                      if (controller.getReviewInProgress) {
                        return CenteredCircularProgress();
                      }
                      if (controller.reviewList.isEmpty) {
                        return Center(child: Text('No review data'));
                      }
                      return ListView.builder(
                        itemCount: controller.reviewList.length,
                        itemBuilder: (context, index) {
                          final review = controller.reviewList[index];
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
                                        "${review.user.firstName} ${review.user.lastName}",
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
                                    review.comment,
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
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
