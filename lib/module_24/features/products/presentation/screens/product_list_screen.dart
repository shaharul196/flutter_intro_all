import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/features/products/presentation/controllers/product_list_controller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/data/models/category_model.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/centered_circular_progress.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/presentation/widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  static const String name = '/product-list';

  // final String categoryName;(ui)
  final CategoryModel category;

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // final ProductListController _productListController = ProductListController();
  final ProductListController _productListController = Get.find<ProductListController>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(loadMoreData);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      //TODO ai screen a asar sathe sathe ata call hobe
      _productListController.getProductListByCategory(widget.category.id);
    });
  }

  void loadMoreData() {
    if (_scrollController.position.extentAfter < 400) {
      _productListController.getProductListByCategory(widget.category.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.category.title)),
      body: GetBuilder(
        init: _productListController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return CenteredCircularProgress();
          }
          if(controller.productList.isEmpty){
            return Center(child: Text('No data found'));
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  itemCount: controller.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    // crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(
                      child: ProductCard(
                        productModel: controller.productList[index],
                      ),
                    );
                  },
                ),
              ),
              Visibility(
                visible: controller.getProductListInProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
