import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';

class ProductImage extends StatelessWidget {
  final String prodImages;
  const ProductImage({super.key, required this.prodImages});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Hero(
        tag: prodImages,
        child: Container(
          height: double.infinity,
          width: 300.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            // color:
            //     Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
          ),
          child: Image.network(prodImages),
        ),
      ),
    );
  }
}
