import 'package:flutter/material.dart';
import 'package:shop/data/dummy/dummy_product_details.dart';
import 'package:shop/data/model/cart_model.dart';
import 'package:shop/data/model/product_details_model.dart';
import 'package:shop/global/cart_crud.dart';

import '../../../global/cart_repository.dart';
import '../../home/model/data/product_details_model.dart';

class CartViewModel extends ChangeNotifier {
  List<CartModel> cartItems = <CartModel>[];
  final List<ProductDetailsModel> _pInfo = DummyProductDetails.details;

  double get totalPrice => _totalPrice();

  void getCartProducts() {
    CartCRUD(cartItems, _pInfo).getCartProducts();
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
          .map((item) => item.itemQuantity * (item.productPrice ?? 0.0))
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
