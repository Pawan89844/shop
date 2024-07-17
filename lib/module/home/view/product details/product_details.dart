import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/home/view/product%20details/product_image.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';
import 'dart:math' as math;

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  void initState() {
    super.initState();
  }

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

    final bottomNavBar = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBoldText('\$50.00'),
              SizedBox(height: 3.0),
              AppText(AppString.priceText),
            ],
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {},
            style:
                ElevatedButton.styleFrom(backgroundColor: AppColor.buttonColor),
            child: const AppText(
              AppString.addToCartText,
              color: Colors.white,
            ),
          )
        ],
      ),
    );

    return Consumer<HomeViewModel>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: appBar,
          bottomNavigationBar: bottomNavBar,
          body: ListView(
            physics: const BouncingScrollPhysics(),
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
                        const AppBoldText(AppString.colorText, fontSize: 20.0),
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
                            4,
                            (i) => const Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFFE9E9E9),
                                    radius: 12.0,
                                    child: AppText('S'),
                                  ),
                                )),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              // PRODUCT INFO
              const Padding(
                padding: EdgeInsets.only(left: 14.0),
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 8.0),
                    child:
                        AppBoldText(AppString.descriptionText, fontSize: 20.0),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: AppText(
                      AppString.dummyDescription,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  isThreeLine: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ProductTrailing extends StatelessWidget {
  const _ProductTrailing();

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
