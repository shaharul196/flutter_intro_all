import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/review/presentation/screens/add_review.screen.dart';


class TotalReviewAndAddSection extends StatefulWidget {
  const TotalReviewAndAddSection({super.key,});


  @override
  State<TotalReviewAndAddSection> createState() =>
      _TotalReviewAndAddSectionState();
}

class _TotalReviewAndAddSectionState extends State<TotalReviewAndAddSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Reviews(1000)',
              style: TextTheme.of(context).bodyLarge?.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.themeColor,
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AddReviewScreen.name);
                    },
                  icon: Icon(Icons.add, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
