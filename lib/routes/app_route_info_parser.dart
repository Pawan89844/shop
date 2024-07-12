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
    // if(configuration == AppRoutes.home){
    //   return RouteInformation(uri: Uri.);
    // }
    return RouteInformation();
  }
}
