import 'package:flutter/material.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

import '../../../../constants/app_string.dart';
import '../../../../widgets/app_bold_text.dart';
import '../../../../widgets/app_text.dart';

class ProductDescriptionUIComponent {
  ProductDetailsViewModel viewModel;

  ProductDescriptionUIComponent(this.viewModel);

  Padding _productDescription() => Padding(
        padding: const EdgeInsets.all(6.0),
        child: AppText(
          viewModel.product?.productDescription as String,
          textAlign: TextAlign.justify,
        ),
      );

  ListTile _descriptionTitle() => ListTile(
        title: const Padding(
          padding: EdgeInsets.only(bottom: 5.0, top: 8.0),
          child: AppBoldText(AppString.descriptionText, fontSize: 20.0),
        ),
        subtitle: _productDescription(),
        isThreeLine: true,
      );

  Padding productDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: _descriptionTitle(),
    );
  }
}
