class ProductDetailsModel {
  final String prodId;
  final String prodName;
  final String description;
  final List<String> prodImages;
  final bool isInStock;
  final double rating;
  final double reviews;
  final List<String> sizes;
  final double price;

  ProductDetailsModel(
      {required this.prodId,
      required this.prodName,
      required this.description,
      required this.prodImages,
      required this.isInStock,
      required this.rating,
      required this.reviews,
      required this.sizes,
      required this.price});

  static List<String> _convertList(Map<String, dynamic> json, String key) {
    if (json[key] is List) {
      return List<String>.from(json[key]);
    }
    return json[key];
  }

  factory ProductDetailsModel.fromJSON(Map<String, dynamic> json) {
    return ProductDetailsModel(
        prodId: json['prodId'],
        prodName: json['prodName'],
        description: json['description'],
        prodImages: _convertList(json, 'prodImages'),
        isInStock: json['isInStock'],
        rating: json['rating'],
        reviews: json['reviews'],
        sizes: _convertList(json, 'availableSizes'),
        price: json['price']);
  }
}
