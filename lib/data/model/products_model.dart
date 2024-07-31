class ProductModel {
  final int id;
  final String tittle;
  final String productImage;

  ProductModel(
      {required this.id, required this.tittle, required this.productImage});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          tittle == other.tittle &&
          productImage == other.productImage;

  @override
  int get hashCode => id.hashCode ^ tittle.hashCode ^ productImage.hashCode;
}
