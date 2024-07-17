import 'package:flutter/material.dart';

import '../../../data/dummy/dummy_categories.dart';
import '../../../data/dummy/dummy_offers.dart';
import '../../../data/dummy/dummy_product_details.dart';
import '../../../data/dummy/dummy_products.dart';
import '../../../data/model/product_details_model.dart';

part 'home_view_model.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  int _selectedProdId = 0;

  /// [product] has Product Information such as name, image, and amount etc.
  late final ProductDetailsModel product;

  int get selectedProdId => _selectedProdId;

  /// Used for [ProductDetails] to fetch product by Product Id.
  void getProductById(int productId) {
    final dummyProducts = DummyProductDetails.details;
    product = dummyProducts.firstWhere((item) => item.id == productId);
    notifyListeners();
  }

  set selectedProdId(int id) {
    _selectedProdId = id;
    notifyListeners();
  }
}
