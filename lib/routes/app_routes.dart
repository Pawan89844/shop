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

  AppRoutes({required this.key, required this.path, required this.page});
}

AppRoutes homePageConfig =
    AppRoutes(key: 'home', path: homePage, page: Pages.home);
AppRoutes productDetailsConfig = AppRoutes(
    key: 'productDetails',
    path: productDetailsPage,
    page: Pages.productDetails);
AppRoutes cartConfig = AppRoutes(key: 'cart', path: cartPage, page: Pages.cart);
