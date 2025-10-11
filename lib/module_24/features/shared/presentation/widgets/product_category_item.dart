import 'package:flutter/material.dart';
import 'package:ostad_flutter_sazu/module_24/app/app_colors.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/screens/product_list_screen.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/data/models/category_model.dart';

class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          // arguments: 'Electronics'(ui)
          // arguments: categoryModel.title,
          arguments: categoryModel,
        );
      },
      child: Column(
        spacing: 6,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.network(
              categoryModel.icon,
              height: 32,
              width: 32,
              errorBuilder: (_, __, ___) {
                return Icon(Icons.error_outline, size: 32);
              },
            ),
          ),
          Text(
            _getTitleText(categoryModel.title),
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.themeColor),
          ),
        ],
      ),
    );
  }

  String _getTitleText(String text){
    if(text.length < 10){
      return text;
    }
    return "${text.substring(0, 9)}...";
  }
}
