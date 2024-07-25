import 'package:flutter/material.dart';
import 'package:shop/data/dummy/dummy_product_details.dart';
import 'package:shop/data/dummy/dummy_products.dart';
import 'package:shop/module/home/view/components/products_grid.dart';

import '../../../data/model/products_model.dart';

class ProductsView extends StatelessWidget {
  ProductsView({super.key});
  final dummyProducts = DummyProducts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(forceMaterialTransparency: true),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: dummyProducts.products.length,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return ProductGrid(i: i);
        },
      ),
    );
  }
}
