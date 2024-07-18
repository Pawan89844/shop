class CartModel {
  final int productId;
  final String? productTitle;
  final String? productBrand;
  final String? productImage;
  final String? productSize;
  final String? selectedColor;
  int itemQuantity;
  final double? productPrice;

  CartModel(
      {required this.productId,
      this.productTitle,
      this.productBrand,
      this.productImage,
      this.productSize,
      this.selectedColor,
      this.itemQuantity = 1,
      this.productPrice});
}
