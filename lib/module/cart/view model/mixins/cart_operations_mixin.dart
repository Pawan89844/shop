part of '../cart_view_model.dart';

mixin class CartOperationsMixin {
  // void _updateCartData(
  //     ProductDetailsModel prodDetails, List<CartModel> cartItems) {
  //   int prodIndex =
  //       cartItems.indexWhere((item) => item.productId == prodDetails.id);
  //   CartModel model = cartItems.elementAt(prodIndex);
  //   _assignCartData(model, prodDetails);
  // }

  void _assignCartData(CartModel model, ProductDetailsModel productDetails) {
    model.productBrand = 'Zara';
    model.productImage = productDetails.productImage[0];
    model.productPrice = productDetails.productPrice;
    model.productSize = productDetails.availableSizes[0];
    model.productTitle = productDetails.productName;
    model.selectedColor = 'red';
  }
}
