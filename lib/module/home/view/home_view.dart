import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view/components/product_carousel.dart';
import 'package:shop/module/home/view/components/products_grid.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';
import 'package:shop/widgets/app_text_field.dart';
import 'dart:math' as math;

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      IconButton(
          onPressed: () {}, icon: const Icon(CupertinoIcons.qrcode_viewfinder)),
      IconButton(
          onPressed: () {}, icon: const Icon(CupertinoIcons.chat_bubble_text)),
    ];

    final suffix = IconButton(
        onPressed: () {}, icon: const Icon(Icons.search, size: 25.0));

    return Scaffold(
      appBar: AppBar(
        title: const AppText(AppString.appName),
        actions: actions,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AppTextField(hintText: AppString.searchHintText, suffix: suffix),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, index) => const ProductCarousel(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBoldText(AppString.collectionsCategory),
                    AppText(AppString.showAllText,
                        color: AppColor.textButtonColor)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      5,
                      (i) => const Column(
                            children: [
                              CircleAvatar(radius: 30),
                              SizedBox(height: 8.0),
                              AppText('Hoodies', color: AppColor.boldTextColor),
                            ],
                          )),
                ),
              )
            ],
          ),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBoldText(AppString.popularCategory),
                    AppText(AppString.showAllText,
                        color: AppColor.textButtonColor)
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .5,
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0
                      // mainAxisExtent: 1.0,
                      ),
                  itemCount: 4,
                  itemBuilder: (context, i) => ProductGrid(i: i),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
