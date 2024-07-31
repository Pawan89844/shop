import 'package:flutter_test/flutter_test.dart';
import 'package:shop/global/cart_repository.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

class CartTest {
  final CartRepository _cartRepo = CartRepository(0);
  final CartViewModel _cartViewModel = CartViewModel();
  final HomeViewModel _homeViewModel = HomeViewModel();
  void testCartModule() {
    group('Cart Module Group test', () {
      int cartLength = 0;
      int quantity = 0;
      int actualQuantity = 0;
      test('Add To Cart', () {
        _homeViewModel.addToCart(_cartViewModel);
        for (final item in _cartViewModel.cartItems) {
          actualQuantity = item.itemQuantity;
        }
        expect(cartLength, _cartViewModel.cartItems.length);
      });

      test('Increase Quantity', () {
        _homeViewModel.updateQuantity(_cartViewModel.cartItems, true);
        for (final item in _cartViewModel.cartItems) {
          quantity = item.itemQuantity;
          print('Quantity: $quantity');
        }
        expect(actualQuantity, quantity);
      });
      test('Remove one item from Cart', () {
        _homeViewModel.addToCart(_cartViewModel);
        _cartRepo.updateQuantity(_cartViewModel.cartItems, false);
        expect(_cartViewModel.cartItems.length, quantity - 1);
      });
    });
  }
}
