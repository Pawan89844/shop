import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shop/service/push_notification.dart';

class NotificationService implements PushNotification {
  final FirebaseMessaging _msging = FirebaseMessaging.instance;
  final AuthorizationStatus _authorized = AuthorizationStatus.authorized;
  final AuthorizationStatus _provisioned = AuthorizationStatus.provisional;
  final FlutterLocalNotificationsPlugin _localNotification =
      FlutterLocalNotificationsPlugin();
  int _notificationId = 1;

  Future<bool> _requestPermission(AuthorizationStatus status) async {
    if (status == _authorized && status == _provisioned) {
      return true;
    } else {
      final set = await _msging.requestPermission();
      return set.authorizationStatus == _authorized ? true : false;
    }
  }

  Future<bool> _isPermissionGranted() async {
    NotificationSettings settings = await _msging.getNotificationSettings();
    AuthorizationStatus status = settings.authorizationStatus;
    return await _requestPermission(status);
  }

  void _onGrant(bool permission) async {
    if (permission) {
      await _msging.getInitialMessage();
      FirebaseMessaging.onMessage.listen((msg) => _pushNotification(msg));
    }
  }

  /// This is the main function which takes the input from Firebase and forwards to local notification service.
  Future<void> _pushNotification(RemoteMessage msg) async {
    if (msg.notification != null) {
      return await _showNotification(
          _notificationId++, msg.notification?.title, msg.notification?.body);
    }
  }

  Future<void> _showNotification(int id, String? title, String? body) async {
    final config = _NotificationConfiguration(_localNotification);
    final configInitialize = config.initialize();
    bool? isInitialized = await _localNotification.initialize(configInitialize);
    if (isInitialized != null && isInitialized) {
      return await config.showNotification(id, title, body);
    }
  }

  @override
  void initialize() async {
    bool permission = await _isPermissionGranted();
    _onGrant(permission);
  }
}

class _NotificationConfiguration {
  AndroidInitializationSettings initSettingAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');
  late InitializationSettings initializationSettings;
  FlutterLocalNotificationsPlugin localNotificationsPlugin;

  _NotificationConfiguration(this.localNotificationsPlugin);

  DarwinInitializationSettings _iosInitialization() {
    return DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) {},
    );
  }

  InitializationSettings initialize() {
    initializationSettings = InitializationSettings(
        android: initSettingAndroid, iOS: _iosInitialization());
    return initializationSettings;
  }

  AndroidNotificationDetails _notificationAndroid() =>
      const AndroidNotificationDetails('shop', 'shop_channel',
          importance: Importance.max,
          priority: Priority.high,
          playSound: true,
          ticker: 'ticker');

  DarwinNotificationDetails _notificationIOS() =>
      const DarwinNotificationDetails();

  Future<void> showNotification(int id, String? title, String? body) async {
    NotificationDetails details = NotificationDetails(
        android: _notificationAndroid(), iOS: _notificationIOS());

    return localNotificationsPlugin.show(id, title, body, details);
  }
}
