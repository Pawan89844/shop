import 'package:flutter/material.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/widgets/app_bold_text.dart';

class AppNoInternet extends StatelessWidget {
  const AppNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    var query = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              height: query.size.height * .3,
              child: Image.asset(AppString.noInternetImgPath)),
          const SizedBox(height: 20.0),
          const AppBoldText(
            AppString.noInternetText,
            fontSize: 18.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
