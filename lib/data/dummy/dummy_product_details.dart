import 'package:shop/constants/app_string.dart';
import 'package:shop/data/model/product_details_model.dart';

class DummyProductDetails {
  static final List<ProductDetailsModel> details = <ProductDetailsModel>[
    ProductDetailsModel(
        id: 0,
        productImage: [],
        productName:
            'Scott International Men\'s & Boy\'s Cotton Blend Striped Regular Jacket',
        isInStock: true,
        rating: 4.5,
        reviews: '653',
        availableSizes: ['S', 'M', 'L', 'XL'],
        productDescription: AppString.descriptionText,
        productPrice: 50.00),
    ProductDetailsModel(
        id: 1,
        productImage: [],
        productName:
            'Symbol Premium Men\'s Super Soft Classic Polo T-Shirt: Regular Fit',
        isInStock: true,
        rating: 4.8,
        reviews: '380',
        availableSizes: ['S', 'L', 'XL'],
        productDescription: AppString.descriptionText,
        productPrice: 80.00),
    ProductDetailsModel(
        id: 2,
        productImage: [],
        productName: 'TAGDO Men\'s Waffle Knitted Crew Neck Regular Fit Tees',
        isInStock: false,
        rating: 5.0,
        reviews: '902',
        availableSizes: ['S', 'M', 'L', 'XL'],
        productDescription: AppString.descriptionText,
        productPrice: 200.00),
    ProductDetailsModel(
        id: 3,
        productImage: [],
        productName:
            'Lymio Casual Shirt for Men|| Shirt for Men|| Men Stylish Shirt (Rib-Shirt)',
        isInStock: true,
        rating: 4.2,
        reviews: '633',
        availableSizes: ['S', 'M', 'L', 'XL'],
        productDescription: AppString.descriptionText,
        productPrice: 150.00),
    ProductDetailsModel(
        id: 4,
        productImage: [],
        productName: 'Amazon Brand - Symbol Men\'s Casual Shirt',
        isInStock: true,
        rating: 3.5,
        reviews: '473',
        availableSizes: ['S', 'M', 'L'],
        productDescription: AppString.descriptionText,
        productPrice: 180.00),
  ];
}
