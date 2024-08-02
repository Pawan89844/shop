import 'package:flutter/material.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/search/repository/search_repository.dart';

import '../../home/model/data/products_model.dart';

class SearchViewModel extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();

  List<ProductModel> _history = [];

  List<ProductModel> get history => _history;

  void onSearch(String? value, HomeViewModel homeViweModel) {
    SearchRepository repository =
        SearchRepository(searchController, homeViweModel, history);
    repository.onSearch(value);
    _history = repository.filteredProducts;
    notifyListeners();
  }
}
