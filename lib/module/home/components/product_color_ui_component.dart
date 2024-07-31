import 'package:flutter/material.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

import '../../../constants/app_string.dart';
import '../../../widgets/app_bold_text.dart';
import '../../../widgets/app_text.dart';
import 'dart:math' as math;

class ProductColorUIComponent {
  ProductDetailsViewModel viewModel;

  ProductColorUIComponent(this.viewModel);

  Row _sizeSelector() {
    return Row(
      children: List.generate(
          viewModel.product?.availableSizes.length as int,
          (i) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  backgroundColor: const Color(0xFFE9E9E9),
                  radius: 12.0,
                  child:
                      AppText(viewModel.product?.availableSizes[i] as String),
                ),
              )),
    );
  }

  Column _productSizeSelector() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppBoldText(AppString.sizesText),
        const SizedBox(height: 10.0),
        _sizeSelector(),
      ],
    );
  }

  Row _colorGenerator() {
    return Row(
      children: List.generate(
          4,
          (index) => Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  radius: 12.0,
                  backgroundColor: Colors.primaries[
                      math.Random().nextInt(Colors.primaries.length)],
                ),
              )),
    );
  }

  Padding _selectColor() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBoldText(AppString.colorText, fontSize: 20.0),
          const SizedBox(height: 10.0),
          _colorGenerator(),
        ],
      ),
    );
  }

  Row colorRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _selectColor(),
        const SizedBox(width: 10.0),
        _productSizeSelector(),
      ],
    );
  }
}
