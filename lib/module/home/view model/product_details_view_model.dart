import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/module/home/model/data/products_model.dart';
import 'package:shop/module/home/model/repository/home_repository.dart';
import 'package:shop/service/notification_service.dart';

import '../../../data/dummy/dummy_categories.dart';
import '../../../data/dummy/dummy_offers.dart';
import '../../../data/dummy/dummy_products.dart';
import '../model/data/product_details_model.dart';

part 'home_view_model.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  /// [product] has Product Information such as name, image, and amount etc.
  ProductDetailsModel? product;
  bool _inCart = false;

  bool get inCart => _inCart;

  /// Used for [ProductDetails] to fetch product by Product Id.
  void getProductById(String productId, BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context);
    final api = provider.appProducts?.message;
    final compProd = api?.firstWhere((element) => element.prodId == productId);
    product = compProd?.prodDetails;
    notifyListeners();
  }

  // void addToCart(CartViewModel cartState, String) {
  //   cartState.cartItems.add(CartModel(productId: product?.id ?? 0));
  //   _inCart = CartRepository(product?.id).inCart(cartState.cartItems);
  //   notifyListeners();
  // }

  // CartModel? getCartItemByProductId(List<CartModel> cart) {
  //   return CartRepository(product?.id).getCartItemByProductId(cart);
  // }

  // void updateQuantity(List<CartModel> cart, bool isIncrease) {
  //   CartRepository(product?.id).updateQuantity(cart, isIncrease);
  //   notifyListeners();
  // }
}
