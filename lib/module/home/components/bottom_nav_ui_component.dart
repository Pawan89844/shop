import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_string.dart';
import '../../../data/model/product_details_model.dart';
import '../../../widgets/app_bold_text.dart';
import '../../../widgets/app_text.dart';
import '../../cart/view model/cart_view_model.dart';
import '../model/data/product_details_model.dart';
import '../view model/product_details_view_model.dart';

class BottomNavUIComponent {
  final ProductDetailsViewModel viewModel;

  BottomNavUIComponent(this.viewModel);
  void _addToCartCallback(CartViewModel cartState) {
    // viewModel.addToCart(cartState);
    cartState.getCartProducts();
  }

  ElevatedButton _addToCartButton(CartViewModel cartState) {
    return ElevatedButton(
      onPressed: () => _addToCartCallback(cartState),
      style: ElevatedButton.styleFrom(
          backgroundColor:
              viewModel.inCart ? Colors.green : AppColor.buttonColor),
      child: AppText(
        viewModel.inCart ? AppString.goToCartText : AppString.addToCartText,
        color: Colors.white,
      ),
    );
  }

  Column _priceColumn() {
    ProductDetailsModel? product = viewModel.product;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBoldText('\$${product?.price}'),
        const SizedBox(height: 3.0),
        const AppText(AppString.priceText),
      ],
    );
  }

  Row _botttomPriceAndCheckoutRowButtonRow(CartViewModel cartState) {
    return Row(
      children: [_priceColumn(), const Spacer(), _addToCartButton(cartState)],
    );
  }

  Container bottomNav(CartViewModel cartState) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: _botttomPriceAndCheckoutRowButtonRow(cartState),
    );
  }
}
