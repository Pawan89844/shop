import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

import '../../home/model/data/products_model.dart';

class SearchRepository {
  final TextEditingController searchController;
  final HomeViewModel homeViweModel;
  List<ProductModel> filteredProducts;
  SearchRepository(
      this.searchController, this.homeViweModel, this.filteredProducts);

  bool _compareItem(ProductModel item) {
    return item.prodName
        .toLowerCase()
        .contains(searchController.text.toLowerCase());
  }

  List<ProductModel> _filterList() {
    return homeViweModel.appProducts!.message
        .where((item) => _compareItem(item))
        .toList();
    // return homeViweModel.products.products
    //     .where((item) => _compareItem(item))
    //     .toList();
  }

  void onSearch(String? value) {
    List<ProductModel> result = [];
    if (searchController.text.isEmpty) {
      result = homeViweModel.appProducts!.message;
    } else {
      result = _filterList();
    }
    filteredProducts = result;
  }
}
