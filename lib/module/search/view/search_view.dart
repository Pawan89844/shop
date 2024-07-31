import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/module/search/view%20model/search_view_model.dart';
import 'package:shop/routes/app_state.dart';
import 'package:shop/routes/navigate_page.dart';
import 'package:shop/widgets/app_text.dart';
import 'package:shop/widgets/app_text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    var query = MediaQuery.paddingOf(context);
    var homeViweModel = Provider.of<HomeViewModel>(context);
    var appstate = Provider.of<AppState>(context);
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: Consumer<SearchViewModel>(builder: (context, vm, _) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size(double.infinity, appBar.preferredSize.height + 40),
            child: Padding(
              padding: EdgeInsets.only(top: query.top, left: 14.0, right: 14.0),
              child: AppTextField(
                controller: vm.searchController,
                hintText: AppString.searchHintText,
                onChanged: (value) => vm.onSearch(value, homeViweModel),
              ),
            ),
          ),
          body: vm.history.isEmpty
              ? const Center(
                  child: AppText('You haven\'t searched yet'),
                )
              : ListView.separated(
                  itemBuilder: (context, i) {
                    final prod = vm.history[i];
                    return ListTile(
                      onTap: () =>
                          NavigateTo(appstate).productDetailsPage(prod.id),
                      title: AppText(prod.tittle),
                      leading: Image.network(prod.productImage),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: vm.history.length),
          // body: SafeArea(
          //     child: ),
        );
      }),
    );
  }
}
