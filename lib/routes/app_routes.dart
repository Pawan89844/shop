import 'package:shop/constants/app_page.dart';
import 'package:shop/routes/app_state.dart';

enum Pages {
  home,
  cart,
  productDetails,
}

const String homePage = '/home';
const String productDetailsPage = '/product-details';
const String cartPage = '/cart';

class AppRoutes {
  final String key;
  final String path;
  final Pages page;
  late PageAction? currentPageAction;

  AppRoutes(
      {required this.key,
      required this.path,
      required this.page,
      this.currentPageAction});

  // AppRoutes._(this.key);

  // static AppRoutes home = AppRoutes._('home');
  // static AppRoutes productDetails = AppRoutes._('product-details');
  // static AppRoutes cart = AppRoutes._('cart');

  // static const String productDetails = '/product-details';
}

AppRoutes homePageConfig = AppRoutes(
    key: AppPage.home,
    path: homePage,
    page: Pages.home,
    currentPageAction: null);
AppRoutes productDetailsConfig = AppRoutes(
    key: AppPage.productDetails,
    path: productDetailsPage,
    page: Pages.productDetails,
    currentPageAction: null);
AppRoutes cartConfig = AppRoutes(
    key: AppPage.cart,
    path: cartPage,
    page: Pages.cart,
    currentPageAction: null);
