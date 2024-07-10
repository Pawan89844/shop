import 'dart:math' as math;
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: double.infinity,
        width: 300.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors
                .primaries[math.Random().nextInt(Colors.primaries.length)]),
      ),
    );
  }
}
