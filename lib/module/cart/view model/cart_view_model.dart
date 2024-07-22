import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop/data/dummy/dummy_product_details.dart';
import 'package:shop/data/dummy/dummy_products.dart';
import 'package:shop/data/model/cart_model.dart';
import 'package:shop/data/model/product_details_model.dart';

import '../../../global/cart_repository.dart';
part 'mixins/cart_operations_mixin.dart';

class CartViewModel extends ChangeNotifier with CartOperationsMixin {
  List<CartModel> cartItems = <CartModel>[];
  final List<ProductDetailsModel> _pInfo = DummyProductDetails.details;

  double get totalPrice => _totalPrice();

  // CartViewModel() {
  //   addListener(() {
  //     fetchCart();
  //   });
  //   notifyListeners();
  // }

  void getCartProducts() {
    int i = 0;
    int j = 0;
    while (i < _pInfo.length - 1) {
      if (cartItems[j].productId == _pInfo[i].id) {
        _assignCartData(cartItems[j], _pInfo[i]);
        if (cartItems.length - 1 > j) {
          j++;
        }
      }
      i++;
    }
    notifyListeners();
  }

  void fetchCart() {
    if (cartItems.isNotEmpty) {
      getCartProducts();
    }
  }

  double _totalPrice() {
    if (cartItems.isEmpty) {
      return 0.0;
    } else {
      return cartItems
          .map((item) => item.itemQuantity * item.productPrice!)
          .reduce((a, b) => a + b)
          .toDouble();
    }
  }

  void updateQuantity(int prodId, bool isIncrease) {
    CartRepository(prodId).updateQuantity(cartItems, isIncrease);
    notifyListeners();
  }

  void deleteItem(int prodId) {
    CartRepository(prodId).deleteCartItem(cartItems);
    notifyListeners();
  }
}
