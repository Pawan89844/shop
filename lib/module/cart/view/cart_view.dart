import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/data/model/cart_model.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
import 'package:shop/module/cart/view/cart_card.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class CartView extends StatelessWidget with _CartViewMixin {
  CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: const AppText(AppString.cartPage),
      actions: actions,
    );

    return Consumer<CartViewModel>(
      builder: (___, viewModel, __) {
        return isCartEmtpy(
            cartList: viewModel.cartItems,
            isEmpty: viewModel.cartItems.isEmpty,
            child: Scaffold(
              appBar: appBar,
              bottomNavigationBar: bottomNavBar(context),
              body: ListView(
                primary: true,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTile(
                    title: AppBoldText(
                        '${viewModel.cartItems.length} ${AppString.itemsText}'),
                    trailing: Container(
                      width: 140.0,
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const AppText(AppString.checkoutAllText,
                              color: AppColor.textButtonColor, fontSize: 15.0)
                        ],
                      ),
                    ),
                  ),
                  ListView.builder(
                    itemCount: viewModel.cartItems.length,
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, i) =>
                        CartCard(cart: viewModel.cartItems[i]),
                  ),
                ],
              ),
            ));
      },
    );
  }
}

mixin class _CartViewMixin {
  final actions = [
    IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
    const SizedBox(width: 8.0),
  ];

  Widget _bottomNavPriceSection(double totalPrice) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBoldText('\$$totalPrice'),
        const SizedBox(height: 3.0),
        const AppText(AppString.priceText),
      ],
    );
  }

  Widget bottomNavBar(BuildContext context) {
    var viewModel = Provider.of<CartViewModel>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: Row(
        children: [
          _bottomNavPriceSection(viewModel.totalPrice),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColor.buttonColor),
            child: const AppText(
              AppString.checkoutText,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget isCartEmtpy(
      {List<CartModel>? cartList,
      required bool isEmpty,
      required Widget child}) {
    if (cartList == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    } else if (isEmpty) {
      return const Scaffold(
        body: Center(child: AppText('Oops! no product items are in cart yet!')),
      );
    } else {
      return child;
    }
  }
}
