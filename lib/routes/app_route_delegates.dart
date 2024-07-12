import 'package:flutter/material.dart';
import 'package:shop/module/cart/view/cart_view.dart';
import 'package:shop/module/home/view/home_view.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/routes/app_state.dart';

class AppRouteDelegates extends RouterDelegate<AppRoutes>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutes> {
  final List<Page> _pages = [];

  final AppState appState;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouteDelegates(this.appState)
      : navigatorKey = GlobalKey<NavigatorState>() {
    appState.addListener(() {
      notifyListeners();
    });
  }

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  int numPages() => _pages.length;

  @override
  AppRoutes get currentConfiguration => _pages.last.arguments as AppRoutes;

  @override
  Widget build(BuildContext context) {
    throw Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      // initialRoute: '/${AppRoutes.home}',
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void _removePage(MaterialPage? page) {
    if (page != null) {
      _pages.remove(page);
    }
  }

  bool canPop() {
    return _pages.length > 1;
  }

  void pop() {
    if (canPop()) {
      _removePage(pages.last);
    }
  }

  MaterialPage _create(Widget child, AppRoutes route) {
    return MaterialPage(
        child: child,
        key: ValueKey(route.key),
        name: route.path,
        arguments: route);
  }

  void _addPageData(Widget child, AppRoutes route) {
    _pages.add(_create(child, route));
  }

  void addPage(AppRoutes route) {
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as AppRoutes).page != route.page;

    if (shouldAddPage) {
      switch (route.page) {
        case Pages.home:
          _addPageData(const HomeView(), route);
          break;
        case Pages.productDetails:
          _addPageData(const ProductDetails(), route);
        case Pages.cart:
          _addPageData(const CartView(), route);
        default:
      }
    }
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage?);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(AppRoutes configuration) {
    // TODO: implement setNewRoutePath
    throw UnimplementedError();
  }
}
