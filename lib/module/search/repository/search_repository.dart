import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

import '../../../data/model/products_model.dart';

class SearchRepository {
  final TextEditingController searchController;
  final HomeViewModel homeViweModel;
  List<ProductModel> filteredProducts;
  SearchRepository(
      this.searchController, this.homeViweModel, this.filteredProducts);

  List<ProductModel> _filterList() {
    return homeViweModel.products.products
        .where((item) => item.tittle
            .toLowerCase()
            .contains(searchController.text.toLowerCase()))
        .toList();
  }

  void onSearch(String? value) {
    List<ProductModel> result = [];
    if (searchController.text.isEmpty) {
      result = homeViweModel.products.products;
    } else {
      result = _filterList();
    }
    filteredProducts = result;
  }
}
