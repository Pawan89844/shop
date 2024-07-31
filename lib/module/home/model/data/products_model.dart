import '../data/product_details_model.dart';

class ProductsViaAPI {
  final bool status;
  final List<ProductModel> message;

  ProductsViaAPI({required this.status, required this.message});

  factory ProductsViaAPI.fromJSON(Map<String, dynamic> json) {
    return ProductsViaAPI(
      status: json['status'],
      message: List.from(json['message'])
          .map((res) => ProductModel.fromJSON(res))
          .toList(),
    );
  }
}

class ProductModel {
  final String prodId;
  final String prodName;
  final String prodImage;
  final ProductDetailsModel prodDetails;

  ProductModel(
      {required this.prodId,
      required this.prodName,
      required this.prodImage,
      required this.prodDetails});

  factory ProductModel.fromJSON(Map<String, dynamic> json) {
    return ProductModel(
      prodId: json['prodId'],
      prodName: json['prodName'],
      prodImage: json['prodImage'],
      prodDetails: ProductDetailsModel.fromJSON(json['prodDetails']),
    );
  }
}
