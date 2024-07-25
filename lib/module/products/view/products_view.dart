import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/data/dummy/dummy_product_details.dart';
import 'package:shop/data/dummy/dummy_products.dart';
import 'package:shop/module/home/components/products_grid.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

import '../../../data/model/products_model.dart';

class ProductsView extends StatelessWidget {
  ProductsView({super.key});
  final dummyProducts = DummyProducts();

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppState>(context);
    final actions = [
      IconButton(
          onPressed: () => NavigateTo(appstate).searchPage(),
          icon: const Icon(Icons.search))
    ];
    return Scaffold(
      appBar: AppBar(
          forceMaterialTransparency: true,
          actions: actions,
          title: AppText(AppString.productsPage.toUpperCase(), fontSize: 18.0)),
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
