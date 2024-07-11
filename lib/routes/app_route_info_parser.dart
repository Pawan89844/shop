import 'package:flutter/material.dart';
import 'package:shop/routes/app_routes.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRoutes> {
  @override
  Future<AppRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;
    if (uri.pathSegments.isEmpty) {
      return AppRoutes.home;
    }
    return AppRoutes.home;
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutes configuration) {
    // if(configuration == AppRoutes.home){
    //   return RouteInformation(uri: Uri.);
    // }
    return RouteInformation();
  }
}
