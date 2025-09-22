import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';

class TotalReviewAndAddSection extends StatelessWidget {
  const TotalReviewAndAddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Reviews(1000)', style: TextTheme.of(context).bodyLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            )),
            SizedBox(
              height: 50,
              width: 50,
              child: CircleAvatar(
                backgroundColor: AppColors.themeColor,
                child: IconButton(
                  onPressed: () {},
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