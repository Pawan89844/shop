import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/data/dummy/dummy_products.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_text.dart';

class ProductGrid extends StatelessWidget {
  final int i;
  ProductGrid({super.key, required this.i});
  final products = DummyProducts();

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    String product = products.products[i].tittle;
    final image =
        Image.network(products.products[i].productImage, isAntiAlias: true);
    return InkWell(
      onTap: () => appState.currentAction = PageAction(
          state: PageState.addWidget,
          widget: const ProductDetails(),
          page: productDetailsConfig),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 13.0 / 12.0,
            child: Card(
              surfaceTintColor: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              elevation: 0.5,
              child: image,
            ),
          ),
          const SizedBox(height: 12.0),
          Column(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: AppText(
                    product,
                    fontWeight: FontWeight.w400,
                    textAlign: TextAlign.center,
                    maxLine: 2,
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// header: const Icon(Icons.person, size: 150.0),
      // footer: Container(
      //     alignment: Alignment.center,
      //     margin: const EdgeInsets.only(bottom: 8.0),
      //     child: AppText('Sample $i')),
