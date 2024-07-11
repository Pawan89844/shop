import 'package:flutter/material.dart';
import 'package:shop/module/home/view/home_view.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/widgets/app_text.dart';

class AppRouteDelegates extends RouterDelegate<AppRoutes>
    with PopNavigatorRouterDelegateMixin<AppRoutes> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouteDelegates() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw Navigator(
      key: navigatorKey,
    );
  }

  @override
  Future<bool> popRoute() {
    // TODO: implement popRoute
    throw UnimplementedError();
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Future<void> setNewRoutePath(AppRoutes configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
