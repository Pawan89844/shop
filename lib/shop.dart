import 'package:flutter/material.dart';
import 'package:shop/routes/app_back_button_dispatcher.dart';
import 'package:shop/routes/app_route_delegates.dart';
import 'package:shop/routes/app_route_info_parser.dart';
import 'package:shop/routes/app_routes.dart';
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

  // late StreamSubscription linkStream;

  _ShopState() {
    delegate = AppRouteDelegates();
    delegate.setNewRoutePath(homePageConfig);
    backButtonDispatcher = AppBackButtonDispatcher(delegate);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
