import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop/constants/app_page.dart';
import 'package:shop/module/cart/view/cart_view.dart';
import 'package:shop/module/home/view/home_view.dart';
import 'package:shop/module/home/view/product%20details/product_details.dart';
import 'package:shop/routes/app_routes.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_no_internet.dart';

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
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: buildPage(),
      // initialRoute: '/${AppRoutes.home}',
    );
  }

  List<Page> buildPage() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        _setPageAction(appState.currentAction);
        addPage(appState.currentAction.page as AppRoutes);
        break;
      case PageState.addAll:
        _setPageAction(appState.currentAction);
        addAll(appState.currentAction.page as List<AppRoutes>);
        break;
      case PageState.addWidget:
        _setPageAction(appState.currentAction);
        pushWidget(
            appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.pop:
        pop();
        break;
      case PageState.replace:
        // TODO: Handle this case.
        break;
      case PageState.replaceAll:
        // TODO: Handle this case.
        break;
    }
    appState.resetCurrentAction();
    return List.of(_pages);
  }

  void _setPageAction(PageAction action) {
    switch (action.page?.page) {
      case Pages.home:
        homePageConfig.currentPageAction = action;
        break;
      case Pages.productDetails:
        productDetailsConfig.currentPageAction = action;
      case Pages.cart:
        cartConfig.currentPageAction = action;
      default:
        break;
    }
  }

  void parseRoute(Uri uri) {
    if (uri.pathSegments.isEmpty) {
      setNewRoutePath(homePageConfig);
      return;
    } else if (uri.pathSegments.length == 1) {
      final path = uri.pathSegments[0];
      switch (path) {
        case AppPage.home:
          replaceAll(homePageConfig);
          break;
        case AppPage.cart:
          replaceAll(cartConfig);
          break;
        case AppPage.productDetails:
          replaceAll(productDetailsConfig);
          break;
      }
    }
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

  void replace(AppRoutes route) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(route);
  }

  void setPath(List<MaterialPage> path) {
    _pages.clear();
    _pages.addAll(path);
  }

  void replaceAll(AppRoutes newRoute) {
    setNewRoutePath(newRoute);
  }

  void push(AppRoutes newRoute) {
    addPage(newRoute);
  }

  void pushWidget(Widget child, AppRoutes newRoute) {
    _addPageData(child, newRoute);
  }

  void addAll(List<AppRoutes> routes) {
    _pages.clear();
    for (final route in routes) {
      addPage(route);
    }
  }

  // void _setPageAction(PageAction action){
  //   switch (action.page?.page) {
  //     case Pages.home:
  //       homePageConfig.
  //       break;
  //     default:
  //   }
  // }

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
          _addPageData(HomeView(), route);
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
    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as AppRoutes).page != configuration.page;
    if (shouldAddPage) {
      _pages.clear();
      addPage(configuration);
    }
    return SynchronousFuture(null);
  }
}
