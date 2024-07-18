import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/data/model/cart_model.dart';
import 'package:shop/data/model/product_details_model.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
import 'package:shop/module/cart/view/cart_view.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/home/view/product%20details/product_image.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';
import 'dart:math' as math;

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  Container _bottomNav(
      ProductDetailsViewModel viewModel, CartViewModel cartState) {
    ProductDetailsModel? product = viewModel.product;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBoldText('\$${product?.productPrice}'),
              const SizedBox(height: 3.0),
              const AppText(AppString.priceText),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => viewModel.addToCart(cartState),
            style: ElevatedButton.styleFrom(
                backgroundColor: viewModel.isInCart(cartState.cartItems)
                    ? Colors.green
                    : AppColor.buttonColor),
            child: AppText(
              viewModel.isInCart(cartState.cartItems)
                  ? AppString.goToCartText
                  : AppString.addToCartText,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    var appState = Provider.of<AppState>(context, listen: false);
    var cartState = Provider.of<CartViewModel>(context);

    final actions = [
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
      IconButton(
          onPressed: () => appState.currentAction = PageAction(
              state: PageState.addWidget,
              page: cartConfig,
              widget: const CartView()),
          icon: const Icon(CupertinoIcons.cart))
    ];

    final appBar = AppBar(
      title: const AppText(AppString.productDetailsPage),
      actions: actions,
    );

    return Consumer<ProductDetailsViewModel>(
      builder: (context, viewModel, __) {
        if (viewModel.product == null) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: appBar,
            bottomNavigationBar: _bottomNav(viewModel, cartState),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: query.size.height * .5,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: viewModel.product?.productImage.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    itemBuilder: (context, i) => ProductImage(
                        prodImages:
                            viewModel.product?.productImage[i] as String),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ListTile(
                    title:
                        AppBoldText(viewModel.product?.productName as String),
                    trailing:
                        _ProductTrailing(viewModel.product?.isInStock as bool),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.star, color: Colors.yellow),
                          const SizedBox(width: 8.0),
                          AppText(
                              '${viewModel.product?.rating} (${viewModel.product?.reviews} review)')
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 40.0,
                      width: 100.0,
                      margin: const EdgeInsets.only(right: 30.0),
                      decoration: BoxDecoration(
                          color: const Color(0xFFF8F8F9),
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 40.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            alignment: Alignment.center,
                            child: const Icon(Icons.remove),
                          ),
                          const AppText('1'),
                          Container(
                            width: 40.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10.0)),
                            alignment: Alignment.center,
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppBoldText(AppString.colorText,
                              fontSize: 20.0),
                          const SizedBox(height: 10.0),
                          Row(
                            children: List.generate(
                                4,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: CircleAvatar(
                                        radius: 12.0,
                                        backgroundColor: Colors.primaries[
                                            math.Random().nextInt(
                                                Colors.primaries.length)],
                                      ),
                                    )),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AppBoldText(AppString.sizesText),
                        const SizedBox(height: 10.0),
                        Row(
                          children: List.generate(
                              viewModel.product?.availableSizes.length as int,
                              (i) => Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: CircleAvatar(
                                      backgroundColor: const Color(0xFFE9E9E9),
                                      radius: 12.0,
                                      child: AppText(viewModel.product
                                          ?.availableSizes[i] as String),
                                    ),
                                  )),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                // PRODUCT INFO
                Padding(
                  padding: const EdgeInsets.only(left: 14.0),
                  child: ListTile(
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 5.0, top: 8.0),
                      child: AppBoldText(AppString.descriptionText,
                          fontSize: 20.0),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: AppText(
                        viewModel.product?.productDescription as String,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    isThreeLine: true,
                  ),
                ),
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
