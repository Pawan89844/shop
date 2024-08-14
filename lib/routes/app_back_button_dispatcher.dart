import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop/routes/app_route_delegates.dart';

class AppBackButtonDispatcher extends RootBackButtonDispatcher {
  final AppRouteDelegates _routeDelegates;

  AppBackButtonDispatcher(this._routeDelegates) : super();

  @override
  Future<bool> didPopRoute() async {
    return _routeDelegates.isPagePopped;
  }
}
