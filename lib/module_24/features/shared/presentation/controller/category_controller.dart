import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_flutter_sazu/module_24/core/services/network_caller.dart';
import 'package:ostad_flutter_sazu/module_24/features/shared/data/models/category_model.dart';
import '../../../../app/urls.dart';
import '../../../../core/models/network_response.dart';

class CategoryController extends GetxController {
  int _currentPage = 0;
  int? _lastPageNo;
  final int _pageSize = 40;

  bool _getCategoryInProgress = false;
  bool _initialLoading = false;
  List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  bool get getCategoryInProgress => _getCategoryInProgress;

  bool get initialLoading => _initialLoading;

  List<CategoryModel> get categoryList => _categoryList;

  String? get errorMessage => _errorMessage;

  Future<bool> getCategoryList() async {
    bool isSuccess = false;

    if (_currentPage > (_lastPageNo ?? 1)) {
      // TODO return korbe mane kicui hobe na
      return false;
    }
    if (_currentPage == 0) {
      _categoryList.clear();
      _initialLoading = true;
    } else {
      _getCategoryInProgress = true;
    }
    update();
    _currentPage++;

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: Urls.categoryListUrl(_currentPage, _pageSize),
    );
    if(response.isSuccess){
      _lastPageNo = response.body!['data']['last_page'];
      List<CategoryModel> list = [];
      for(Map<String,dynamic> jsonData in response.body!['data']['results']){
        list.add(CategoryModel.fromJson(jsonData));
      }
      // _categoryList = list;
      _categoryList.addAll(list);
      isSuccess = true;
      _errorMessage = null;
    }else{
      _errorMessage = response.errorMassage;
    }

    if (_initialLoading) {
      _initialLoading = false;
    } else {
      _getCategoryInProgress = false;
    }
    update();
    return isSuccess;
  }

  Future<void> refreshCategoryList() async {
    _currentPage = 0;
    getCategoryList();
  }
}
