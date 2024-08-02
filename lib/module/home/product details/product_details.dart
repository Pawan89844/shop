import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/home/components/bottom_nav_ui_component.dart';
import 'package:shop/module/home/components/product_color_ui_component.dart';
import 'package:shop/module/home/components/product_description_ui_component.dart';
import 'package:shop/module/home/components/product_title_ui_component.dart';
import 'package:shop/module/home/product%20details/product_image.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/widgets/app_text.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var appStateGlobal = Provider.of<AppState>(context, listen: false);
    // var cartState = Provider.of<CartViewModel>(context);

    final actions = [
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
      IconButton(
          onPressed: () => NavigateTo(appStateGlobal).cartPage(),
          icon: const Icon(CupertinoIcons.cart))
    ];

    final appBar = AppBar(
      title: const AppText(AppString.productDetailsPage),
      actions: actions,
    );

    return Consumer4<AppState, CartViewModel, ProductDetailsViewModel,
        HomeViewModel>(
      builder: (context, appState, cartState, viewModel, homeState, __) {
        if (viewModel.product == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: appBar,
            bottomNavigationBar:
                BottomNavUIComponent(viewModel).bottomNav(cartState),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: query.size.height * .5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: viewModel.product?.prodImages.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, i) => ProductImage(
                        prodImages: viewModel.product?.prodImages[i] as String),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ListTile(
                    // title:
                    //     AppBoldText(viewModel.product?. as String),
                    trailing:
                        _ProductTrailing(viewModel.product?.isInStock as bool),
                  ),
                ),
                ProductTitleUIComponent(viewModel, cartState)
                    .productReviewsSection(),
                const SizedBox(height: 20.0),
                ProductColorUIComponent(viewModel).colorRow(),
                const SizedBox(height: 10.0),
                // PRODUCT INFO
                ProductDescriptionUIComponent(viewModel).productDescription()
              ],
            ),
          );
        }
      },
    );
  }
}

class _ProductTrailing extends StatelessWidget {
  final bool isInStock;
  const _ProductTrailing(this.isInStock);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: isInStock ? Colors.blue.shade100 : Colors.red.shade100,
          borderRadius: BorderRadius.circular(25.0)),
      child: TextButton(
          onPressed: () {},
          child: AppText(
              isInStock ? AppString.inStockText : AppString.stockOutText,
              color: isInStock ? Colors.blue : Colors.red.shade600)),
    );
  }
}
