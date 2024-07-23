import '../data/model/cart_model.dart';
import '../data/model/product_details_model.dart';

class CartCRUD {
  final List<CartModel> cartItems;
  final List<ProductDetailsModel> productInfo;

  CartCRUD(this.cartItems, this.productInfo);

  int _i = 0, _j = 0;

  void _assignCartData(CartModel model, ProductDetailsModel productDetails) {
    model.productBrand = 'Zara';
    model.productImage = productDetails.productImage[0];
    model.productPrice = productDetails.productPrice;
    model.productSize = productDetails.availableSizes[0];
    model.productTitle = productDetails.productName;
    model.selectedColor = 'red';
  }

  void _getProductLogic() {
    if (cartItems[_j].productId == productInfo[_i].id) {
      _assignCartData(cartItems[_j], productInfo[_i]);
      if (cartItems.length - 1 > _j) {
        _j++;
      }
    }
  }

  void getCartProducts() {
    while (_i < productInfo.length - 1) {
      _getProductLogic();
      _i++;
    }
  }
}
