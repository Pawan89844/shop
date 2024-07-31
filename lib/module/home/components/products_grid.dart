import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_text.dart';

class ProductGrid extends StatelessWidget {
  final int i;
  const ProductGrid({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context, listen: false);
    var provider = Provider.of<HomeViewModel>(context);

    return GestureDetector(
      onTap: () => NavigateTo(appState)
          .productDetailsPage(provider.appProducts?.message[i].prodId, context),
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
                  child: provider.appProducts == null
                      ? const Center(child: CircularProgressIndicator())
                      : Image.network(
                          provider.appProducts!.message[i].prodImage,
                          isAntiAlias: true),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Column(
            children: [
              Container(
                  alignment: Alignment.topCenter,
                  margin: const EdgeInsets.only(bottom: 8.0),
                  child: AppText(
                    provider.appProducts?.message[i].prodName ?? '',
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
