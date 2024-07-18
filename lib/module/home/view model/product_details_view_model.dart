import 'package:flutter/material.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';

import '../../../data/dummy/dummy_categories.dart';
import '../../../data/dummy/dummy_offers.dart';
import '../../../data/dummy/dummy_product_details.dart';
import '../../../data/dummy/dummy_products.dart';
import '../../../data/model/cart_model.dart';
import '../../../data/model/product_details_model.dart';

part 'home_view_model.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  /// [product] has Product Information such as name, image, and amount etc.
  ProductDetailsModel? product;

  /// Used for [ProductDetails] to fetch product by Product Id.
  void getProductById(int productId) {
    final dummyProducts = DummyProductDetails.details;
    product = dummyProducts.firstWhere((item) => item.id == productId);
    notifyListeners();
  }

  void addToCart(CartViewModel cartState) {
    cartState.cartItems.add(CartModel(productId: product?.id as int));
    isInCart(cartState.cartItems);
    notifyListeners();
  }

  bool isInCart(List<CartModel> cart) {
    final prod = cart.any((item) => item.productId == product?.id as int);
    return prod;
  }

  CartModel? getCartItemByProductId(List<CartModel> cart) {
    int index = cart.indexWhere((item) => item.productId == product?.id);
    CartModel? item = index == -1 ? null : cart.elementAt(index);
    return item;
  }

  void updateQuantity(List<CartModel> cart, bool isIncrease) {
    final item = getCartItemByProductId(cart);
    if (isIncrease) {
      item?.itemQuantity++;
    }
    if (!isIncrease && item?.itemQuantity as int >= 1) {
      item?.itemQuantity--;
    }
    if (!isIncrease && item?.itemQuantity == 0) {
      deleteCartItem(cart);
    }
    notifyListeners();
  }

  void deleteCartItem(List<CartModel> cart) {
    cart.removeWhere((item) => item.productId == product?.id);
  }
}
