import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/constants/app_string.dart';
import 'package:shop/module/home/view%20model/product_details_view_model.dart';
import 'package:shop/widgets/app_bold_text.dart';
import 'package:shop/widgets/app_text.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final homeVM = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar:
          AppBar(title: const AppBoldText(AppString.notificationPageTitleText)),
      body: const NotificationContent(),
    );
  }
}

class NotificationContent extends StatelessWidget {
  const NotificationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final homeVM = Provider.of<HomeViewModel>(context);
    // return const Padding(
    //   padding: EdgeInsets.all(12.0),
    //   child: ListTile(
    //     leading: CircleAvatar(),
    //     title: AppBoldText('', fontSize: 18.0),
    //     subtitle: AppText(''),
    //   ),
    // );
    return StreamBuilder<RemoteMessage>(
        stream: homeVM.notification.message.stream,
        builder: (context, snapshot) {
          if (snapshot.data?.notification == null) {
            return const Center(child: AppText(AppString.noNotificationText));
          } else {
            final data = snapshot.data?.notification;
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListTile(
                leading: const CircleAvatar(),
                title: AppBoldText(data?.title ?? '', fontSize: 18.0),
                subtitle: AppText(data?.body ?? ''),
              ),
            );
          }
        });
  }
}
