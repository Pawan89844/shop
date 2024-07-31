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
  final _notification = NotificationService();
  ProductsViaAPI? appProducts;
  // RemoteMessage? _message;

  // RemoteMessage? get message => _message;

  NotificationService get notification => _notification;

  void getProducts() async {
    final repo = await HomeRepository(appProducts).getProductsInIsolate();
    appProducts = repo;
    notifyListeners();
  }

  // RemoteMessage? remoteMessage() {
  //   _notification.message.stream.listen((msg) {
  //     _message = msg;
  //     notifyListeners();
  //   });
  //   return null;
  // }

  // void disposeRemoteMessage() {
  //   _notification.message.sink.close();
  // }
}
