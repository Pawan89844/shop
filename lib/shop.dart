import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/module/cart/view/cart_view.dart';
import 'package:shop/module/home/view/home_view.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/module/profile/view/profile_view.dart';
import 'package:shop/routes/app_back_button_dispatcher.dart';
import 'package:shop/routes/app_route_delegates.dart';
import 'package:shop/routes/app_route_info_parser.dart';
import 'package:shop/routes/app_state.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final appState = AppState();
  late AppRouteDelegates delegate;
  late AppBackButtonDispatcher backButtonDispatcher;
  final parser = AppRouteInformationParser();

  _ShopState() {
    delegate = AppRouteDelegates(appState);
    backButtonDispatcher = AppBackButtonDispatcher(delegate);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: delegate,
      routeInformationParser: parser,
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ProfileView(),
    // );
  }
}
