import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';

class AppConnectivityService {
  StreamSubscription<List<ConnectivityResult>> subscription =
      Connectivity().onConnectivityChanged.listen((event) {});

  void dispose() {
    subscription.cancel();
    FlutterMemoryAllocations.instance.dispatchObjectDisposed(object: this);
  }
}
