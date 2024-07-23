import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/data/model/products_model.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/widgets/app_text.dart';
import 'package:shop/widgets/app_text_field.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  final List<ProductModel> _history = [];

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar();
    var query = MediaQuery.paddingOf(context);
    var homeViweModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, appBar.preferredSize.height + 40),
        child: Padding(
          padding: EdgeInsets.only(top: query.top, left: 14.0, right: 14.0),
          child: AppTextField(
            controller: searchController,
            hintText: AppString.searchHintText,
            onChanged: (value) {
              if (searchController.text.isNotEmpty) {
                final prod = homeViweModel.products.products
                    .where((item) => item.tittle
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                    .toList();
                _history.addAll([...prod]);
                setState(() {});
              }
            },
          ),
        ),
      ),
      body: _history.isEmpty
          ? const Center(
              child: AppText('You haven\'t searched yet'),
            )
          : ListView.separated(
              itemBuilder: (context, i) {
                final prod = _history[i];
                return ListTile(
                  title: AppText(prod.tittle),
                  leading: Image.network(prod.productImage),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
              itemCount: _history.length),
      // body: SafeArea(
      //     child: ),
    );
  }
}
