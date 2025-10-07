import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/category_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/controller/main_nav_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/product_category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {

  final ScrollController _scrollController = ScrollController();
  final CategoryController _categoryController = Get.find<CategoryController>();

  @override
  void initState() {
    super.initState();
    // TODO ai screen a asar sathe sathe ata call hobe
    WidgetsBinding.instance.addPostFrameCallback((_){
      _categoryController.getCategoryList();
    });


  }

  @override
  Widget build(BuildContext context) {
    // TODO PopScope means system er back kore home screen a jaoya
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        _backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: BackButton(onPressed: _backToHome),
        ),
        body: GetBuilder<CategoryController>(
            builder: (controller) {
              if(controller.initialLoading){
                return CenteredCircularProgress();
              }
            return Padding(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                controller: _scrollController,
                itemCount: controller.categoryList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return FittedBox(child: ProductCategoryItem());
                },
              ),
            );
          }
        ),
      ),
    );
  }

  void _backToHome() {
    Get.find<MainNavController>().backToHome();
  }
}
