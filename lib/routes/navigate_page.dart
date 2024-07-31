import 'package:provider/provider.dart';
import 'package:shop/module/home/view/qr_scan_view.dart';
import 'package:shop/module/products/view/products_view.dart';
import 'package:shop/routes/app_state.dart';

import '../module/home/view model/product_details_view_model.dart';
import '../module/home/product details/product_details.dart';
import '../module/notifications/view/notification_view.dart';
import '../module/search/view/search_view.dart';
import 'app_routes.dart';

abstract class RoutePages {
  void notificationsPage();
  void searchPage();
  void productDetailsPage(int productId);
  void productsPage();
  void qrPage();
}

class NavigateTo implements RoutePages {
  AppState appState;

  NavigateTo(this.appState);

  @override
  void notificationsPage() {
    appState.currentAction = PageAction(
        page: notificationsConfig,
        state: PageState.addPage,
        widget: const NotificationView());
  }

  @override
  void searchPage() {
    appState.currentAction = PageAction(
        state: PageState.addPage,
        page: searchConfig,
        widget: const SearchView());
  }

  @override
  void productDetailsPage(int productId) {
    appState.setProdId = productId;
    appState.currentAction = PageAction(
        state: PageState.addWidget,
        widget: ChangeNotifierProvider(
          create: (__) =>
              ProductDetailsViewModel()..getProductById(appState.prodId as int),
          child: const ProductDetails(),
        ),
        page: productDetailsConfig);
  }

  @override
  void productsPage() {
    appState.currentAction = PageAction(
        state: PageState.addPage, page: productsConfig, widget: ProductsView());
  }

  @override
  void qrPage() {
    appState.currentAction = PageAction(
        state: PageState.addPage, page: qrScanConfig, widget: QRScanView());
  }
}
