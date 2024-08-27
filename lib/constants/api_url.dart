class APIURL {
  // static const String _baseURL = 'http://10.0.2.2:$_asusPort/';
  static const String _baseURL = 'http://192.168.101.13:$_asusPort/';
  static const String _port = '8080';
  static const String _asusPort = '2020';

  /// Fetch ALL Products API URL.
  static const String getProducts = '${_baseURL}getProducts';
}
