import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_text.dart';

class ProductGrid extends StatelessWidget {
  final int i;
  const ProductGrid({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    var provider = Provider.of<HomeViewModel>(context);
    String product = provider.products.products[i].tittle;
    final image = Image.network(provider.products.products[i].productImage,
        isAntiAlias: true);
    return GestureDetector(
      onTap: () => NavigateTo(appState)
          .productDetailsPage(provider.products.products[i].id),
      child: Column(
        children: [
          Expanded(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(0.1)
                ..rotateY(-0.1),
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFF8F8F9),
                      offset: Offset(0, 4),
                      blurRadius: 5,
                    ),
                  ],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(15)),
                  child: image,
                ),
              ),
            ),
          ),
          // Expanded(child: image),
          // AspectRatio(
          //   aspectRatio: 13.0 / 12.0,
          //   child: Card(
          //     surfaceTintColor: Colors.blue,
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12.0)),
          //     elevation: 0.5,
          //     child: image,
          //   ),
          // ),
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
