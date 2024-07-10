import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        color: const Color(0xFFF8F8F9),
        height: 80,
        width: 80.0,
      ),
      minLeadingWidth: 80.0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const AppBoldText('Floral Print Shirt', fontSize: 18.0),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.delete, color: Colors.red))
            ],
          ),
          const AppText(
            'Zara',
            color: Colors.black38,
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                label: const AppText('Size: M'),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
              ),
              // const SizedBox(width: 8.0),
              SizedBox(
                width: 88.0,
                child: Chip(
                  label: const Row(
                    children: [
                      AppText('Color: '),
                      CircleAvatar(
                        radius: 7.0,
                        backgroundColor: Colors.red,
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
                label: const AppText('QTY: 01'),
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
              const AppBoldText('01', fontSize: 18.0),
              Chip(
                label: const Icon(Icons.add),
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                color: MaterialStateProperty.all(const Color(0xFFF8F8F9)),
              ),
              const Spacer(),
              const AppBoldText(
                '\$50.00',
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
