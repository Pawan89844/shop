import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop/service/notification_service.dart';
import 'package:shop/shop.dart';

import 'firebase_options.dart';

void main() => _initMain();

void _initMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  NotificationService().initialize();
  runApp(const Shop());
}
