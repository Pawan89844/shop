import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_colors.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/home/components/product_carousel.dart';
import 'package:shop/module/home/components/products_grid.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';
import 'package:shop/widgets/app_text_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeViewModel>(context, listen: false);
    var appState = Provider.of<AppState>(context, listen: false);

    final actions = [
      IconButton(
          onPressed: () => NavigateTo(appState).qrPage(),
          icon: const Icon(CupertinoIcons.qrcode_viewfinder)),
      IconButton(
          onPressed: () => NavigateTo(appState).notificationsPage(),
          icon: const Icon(CupertinoIcons.chat_bubble_text)),
    ];

    final suffix = IconButton(
        onPressed: () {}, icon: const Icon(Icons.search, size: 25.0));

    final appBar = AppBar(
        title: AppText(AppString.appName.toUpperCase()),
        actions: actions,
        forceMaterialTransparency: true);

    return Scaffold(
      appBar: appBar,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          AppTextField(
            hintText: AppString.searchHintText,
            suffix: suffix,
            readOnly: true,
            onTap: () => NavigateTo(appState).searchPage(),
          ),
          SizedBox(
            height: 200.0,
            child: ListView.builder(
              itemCount: provider.offersCarousel.offers.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(12.0),
              itemBuilder: (context, i) =>
                  ProductCarousel(offers: provider.offersCarousel.offers[i]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () => NavigateTo(appState).productsPage(),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppBoldText(AppString.collectionsCategory),
                      AppText(AppString.showAllText,
                          color: AppColor.textButtonColor)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: GestureDetector(
                  onTap: () => NavigateTo(appState).productsPage(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: provider.collections.categories
                        .map((item) => Column(
                              children: [
                                CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        NetworkImage(item.featuredImage)),
                                const SizedBox(height: 8.0),
                                AppText(item.title,
                                    color: AppColor.boldTextColor),
                              ],
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AppBoldText(AppString.popularCategory),
                    GestureDetector(
                      onTap: () => NavigateTo(appState).productsPage(),
                      child: const AppText(AppString.showAllText,
                          color: AppColor.textButtonColor),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .65,
                child: GridView.builder(
                  padding: const EdgeInsets.all(12.0),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  primary: false,
                  // scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 6.6 / 9.0),
                  itemCount: provider.products.products.length - 1,
                  itemBuilder: (context, i) => ProductGrid(i: i),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
