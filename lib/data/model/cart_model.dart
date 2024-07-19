class CartModel {
  final int productId;
  String? productTitle;
  String? productBrand;
  String? productImage;
  String? productSize;
  String? selectedColor;
  int itemQuantity;
  double? productPrice;

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
