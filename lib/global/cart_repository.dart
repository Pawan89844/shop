import '../data/model/cart_model.dart';

abstract interface class CartInterface {
  void updateQuantity(List<CartModel> cart, bool isIncrease);
  void deleteCartItem(List<CartModel> cart);
  bool inCart(List<CartModel> cart);
}

class CartRepository implements CartInterface {
  final int? productId;
  CartRepository(this.productId);

  void _addQuantity(CartModel? item, bool isIncrease) {
    if (isIncrease) {
      item?.itemQuantity++;
    }
  }

  void _removeQuantity(CartModel? item, bool isIncrease) {
    if (!isIncrease && item?.itemQuantity as int >= 1) {
      item?.itemQuantity--;
    }
  }

  void _deleteProductToCart(
      CartModel? item, bool isIncrease, List<CartModel> cart) {
    if (!isIncrease && item?.itemQuantity == 0) {
      deleteCartItem(cart);
    }
  }

  CartModel? getCartItemByProductId(List<CartModel> cart) {
    int index = cart.indexWhere((item) => item.productId == productId);
    CartModel? item = index == -1 ? null : cart.elementAt(index);
    return item;
  }

  @override
  void updateQuantity(List<CartModel> cart, bool isIncrease) {
    final items = getCartItemByProductId(cart);
    _addQuantity(items, isIncrease);
    _removeQuantity(items, isIncrease);
    _deleteProductToCart(items, isIncrease, cart);
  }

  @override
  void deleteCartItem(List<CartModel> cart) {
    cart.removeWhere((item) => item.productId == productId);
  }

  @override
  bool inCart(List<CartModel> cart) {
    return cart.any((item) => item.productId == productId);
  }
}
