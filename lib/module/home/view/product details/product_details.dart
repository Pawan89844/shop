import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view/product%20details/product_image.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';
import 'dart:math' as math;

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);

    final actions = [
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.heart)),
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.cart))
    ];

    final appBar = AppBar(
      title: const AppText(AppString.productDetailsPage),
      actions: actions,
    );

    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: [
          SizedBox(
            height: query.size.height * .5,
            child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, i) => const ProductImage(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0),
            child: ListTile(
              title: AppBoldText('Zara - Jacket With Pockets'),
              trailing: _ProductTrailing(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.star, color: Colors.yellow),
                    SizedBox(width: 8.0),
                    AppText('4.5 (653 review)')
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
          )
        ],
      ),
    );
  }
}

class _ProductTrailing extends StatelessWidget {
  const _ProductTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      width: 80.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: BorderRadius.circular(25.0)),
      child: TextButton(
          onPressed: () {},
          child: const AppText(AppString.inStockText, color: Colors.blue)),
    );
  }
}
