import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/cart/view/cart_card.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
      const SizedBox(width: 8.0),
    ];

    final bottomNavBar = Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 80.0,
      child: Row(
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBoldText('\$250.00'),
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
              AppString.checkoutText,
              color: Colors.white,
            ),
          )
        ],
      ),
    );

    final appBar = AppBar(
      title: const AppText(AppString.cartPage),
      actions: actions,
    );

    return Scaffold(
      appBar: appBar,
      bottomNavigationBar: bottomNavBar,
      body: ListView(
        primary: true,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            title: const AppBoldText('4 ${AppString.itemsText}'),
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
            itemCount: 8,
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) => const CartCard(),
          ),
        ],
      ),
    );
  }
}
