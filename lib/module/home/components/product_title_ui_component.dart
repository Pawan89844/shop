import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

import '../../../widgets/app_text.dart';

class ProductTitleUIComponent {
  ProductDetailsViewModel viewModel;
  CartViewModel cartState;

  ProductTitleUIComponent(this.viewModel, this.cartState);

  GestureDetector _onQuantityChange(
      {required void Function()? onTap, required IconData icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.0,
        height: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        alignment: Alignment.center,
        child: Icon(icon),
      ),
    );
  }

  Row _quantitySection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _onQuantityChange(
            onTap: () {},
            // onTap: () => viewModel.updateQuantity(cartState.cartItems, false),
            icon: Icons.remove),
        // AppText(viewModel
        //         .getCartItemByProductId(cartState.cartItems)
        //         ?.itemQuantity
        //         .toString() ??
        //     ''),
        // _onQuantityChange(
        //     onTap: () => viewModel.updateQuantity(cartState.cartItems, true),
        // icon: Icons.add)
      ],
    );
  }

  Padding _productRatingSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Row(
        children: [
          const Icon(CupertinoIcons.star, color: Colors.yellow),
          const SizedBox(width: 8.0),
          AppText(
              '${viewModel.product?.rating} (${viewModel.product?.reviews} review)')
        ],
      ),
    );
  }

  Container _productRatingContainer() {
    return Container(
      height: 40.0,
      width: 100.0,
      margin: const EdgeInsets.only(right: 30.0),
      decoration: BoxDecoration(
          color: const Color(0xFFF8F8F9),
          borderRadius: BorderRadius.circular(8.0)),
      child: _quantitySection(),
    );
  }

  Row productReviewsSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _productRatingSection(),
        const Spacer(),
        Visibility(
          visible: viewModel.inCart,
          child: _productRatingContainer(),
        )
      ],
    );
  }
}
