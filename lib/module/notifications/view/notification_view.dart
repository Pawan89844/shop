import 'package:flutter/material.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const AppBoldText(AppString.notificationPageTitleText)),
      // body: const NotificationContent(),
      body: const Center(child: AppText(AppString.noNotificationText)),
    );
  }
}

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12.0),
      child: ListTile(
        leading: CircleAvatar(),
        title: AppBoldText('Sample Notification', fontSize: 18.0),
        subtitle: AppText('example of subtitle'),
      ),
    );
  }
}
