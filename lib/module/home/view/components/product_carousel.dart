// import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shop/data/model/offers_model.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class ProductCarousel extends StatelessWidget {
  final OffersModel offers;
  const ProductCarousel({super.key, required this.offers});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200.0,
        width: 300.0,
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 12.0, bottom: 4.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            image: DecorationImage(
                image: NetworkImage(offers.featuredImage), fit: BoxFit.fitWidth)
            // color:
            //     Colors.primaries[math.Random().nextInt(Colors.primaries.length)],
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBoldText(offers.offer, color: Colors.white),
            const Chip(label: AppText('Shop Now'), side: BorderSide.none)
          ],
        ),
      ),
    );
  }
}
