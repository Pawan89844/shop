import 'dart:convert';
import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:shop/constants/api_url.dart';
import 'package:shop/module/home/model/data/products_model.dart';
import 'package:shop/service/api_service.dart';

class HomeRepository {
  final APIService _service = APIService();
  ProductsViaAPI? products;

  HomeRepository(this.products);

  Future<ProductsViaAPI?> getProductsInIsolate() async {
    ReceivePort port = ReceivePort();
    final prod = await compute(_getProducts, port.sendPort);
    return prod;
  }

  Future<ProductsViaAPI?> _getProducts(SendPort sendPort) async {
    final req = await _service.get(APIURL.getProducts);
    if (req.statusCode == 200) {
      final resJson = jsonDecode(req.body);
      sendPort.send(ProductsViaAPI.fromJSON(resJson));
      return ProductsViaAPI.fromJSON(resJson);
    }
    sendPort.send(null);
    return null;
  }
}
