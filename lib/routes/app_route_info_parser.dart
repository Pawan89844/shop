import 'package:flutter/material.dart';
import 'package:shop/routes/app_routes.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutes> {
  @override
  Future<AppRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return homePageConfig;
    }

    final path = '/${uri.pathSegments[0]}';

    switch (path) {
      case homePage:
        return homePageConfig;
      case productDetailsPage:
        return productDetailsConfig;
      case cartPage:
        return cartConfig;
      default:
        return homePageConfig;
    }
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutes configuration) {
    switch (configuration.page) {
      case Pages.home:
        return RouteInformation(uri: Uri.parse(homePage));
      case Pages.productDetails:
        return RouteInformation(uri: Uri.parse(productDetailsPage));
      case Pages.cart:
        return RouteInformation(uri: Uri.parse(cartPage));
      default:
        return RouteInformation(uri: Uri.parse(homePage));
    }
  }
}
