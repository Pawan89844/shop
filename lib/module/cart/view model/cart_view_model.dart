import 'package:flutter/material.dart';
import 'package:shop/data/model/cart_model.dart';

class CartViewModel extends ChangeNotifier {
  List<CartModel> cartItems = <CartModel>[];
}
