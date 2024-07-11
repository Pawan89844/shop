import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/module/cart/view/cart_view.dart';
import 'package:shop/module/home/view/home_view.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/module/profile/view/profile_view.dart';
import 'package:shop/routes/app_route_delegates.dart';

class Shop extends StatelessWidget {
  const Shop({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouteDelegates(),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ProfileView(),
    // );
  }
}
