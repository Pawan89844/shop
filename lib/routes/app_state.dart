import 'package:flutter/material.dart';
import 'package:shop/routes/app_routes.dart';

enum PageState { none, addPage, addAll, addWidget, pop, replace, replaceAll }

class PageAction {
  PageState state;
  AppRoutes? page;
  List<AppRoutes>? pages;
  Widget? widget;

  PageAction({this.state = PageState.none, this.page, this.pages, this.widget});
}

class AppState extends ChangeNotifier {}
