import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/data/model/cart_model.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  const CartCard({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    // inspect(cart);
    return ListTile(
      leading: Container(
        color: Colors.blue,
        // color: const Color(0xFFF8F8F9),
        height: 100,
        // width: 80.0,
        width: 80.0,

        child: Image.network(
          cart.productImage ?? '',
          fit: BoxFit.fitWidth,
        ),
      ),
      minLeadingWidth: 80.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 200.0,
                child: AppBoldText(cart.productTitle ?? '',
                    fontSize: 18.0, overflow: TextOverflow.ellipsis),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red))
            ],
          ),
          AppText(cart.productBrand ?? '', color: Colors.black38),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: AppText('Size: ${cart.productSize}'),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              // const SizedBox(width: 8.0),
              SizedBox(
                width: 88.0,
                child: Chip(
                  label: Row(
                    children: [
                      const AppText('Color: '),
                      CircleAvatar(
                        radius: 7.0,
                        backgroundColor: cart.selectedColor == 'red'
                            ? Colors.red
                            : Colors.blue,
                      )
                    ],
                  ),
                  color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                ),
              ),
              // const SizedBox(width: 5.0),
              Chip(
                label: AppText('QTY: ${cart.itemQuantity}'),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Chip(
                label: const Icon(Icons.remove),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
              ),
              AppBoldText(
                  cart.itemQuantity < 10
                      ? '0${cart.itemQuantity}'
                      : '${cart.itemQuantity}',
                  fontSize: 18.0),
              Chip(
                label: const Icon(Icons.add),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
              ),
              const Spacer(),
              AppBoldText(
                '\$${cart.productPrice?.toStringAsFixed(2)}',
                color: AppColor.buttonColor,
                fontSize: 18.0,
              ),
              const SizedBox(width: 8.0),
              const AppText('\$55.00',
                  fontSize: 13.0,
                  color: Colors.black38,
                  decoration: TextDecoration.lineThrough)
            ],
          )
        ],
      ),
    );
  }
}
