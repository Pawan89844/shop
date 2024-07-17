// import 'package:flutter/material.dart';
// import 'package:shop/data/model/product_details_model.dart';

// import '../../../data/dummy/dummy_categories.dart';
// import '../../../data/dummy/dummy_offers.dart';
// import '../../../data/dummy/dummy_product_details.dart';
// part 'product_details_view_model.dart';
part of 'product_details_view_model.dart';

class HomeViewModel extends ProductDetailsViewModel {
  final offersCarousel = DummyOffers();
  final collections = DummyCategories();
  final products = DummyProducts();
}
