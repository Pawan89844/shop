import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/module/cart/view%20model/cart_view_model.dart';
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
  final cartState = CartViewModel();
  late AppRouteDelegates delegate;
  late AppBackButtonDispatcher backButtonDispatcher;
  final parser = AppRouteInformationParser();

  // late StreamSubscription linkStream;

  _ShopState() {
    delegate = AppRouteDelegates(appState);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => appState),
        ChangeNotifierProvider(create: (context) => cartState),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: delegate,
        routeInformationParser: parser,
        backButtonDispatcher: backButtonDispatcher,
      ),
    );
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ProfileView(),
    // );
  }
}
