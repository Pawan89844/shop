import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:shop/widgets/app_text.dart';

class ProductGrid extends StatelessWidget {
  final int i;
  const ProductGrid({super.key, required this.i});

  @override
  Widget build(BuildContext context) {
    return GridTile(
        // header: const Icon(Icons.person, size: 150.0),
        footer: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 8.0),
            child: AppText('Sample $i')),
        child: Container(
          height: 300.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors
                  .primaries[math.Random().nextInt(Colors.primaries.length)]),
        ));
  }
}
