import 'package:http/http.dart' as http;

abstract interface class APIMethods {
  Future<http.Response> get(String url);
  Future<http.Response> post(
      String url, Object? body, Map<String, String>? header);
}

class APIService implements APIMethods {
  final _header = {'content-type': 'application/json'};

  @override
  Future<http.Response> get(String url) async {
    final uri = Uri.parse(url);
    http.Response req = await http.get(uri, headers: _header);
    return req;
  }

  @override
  Future<http.Response> post(
      String url, Object? body, Map<String, String>? header) async {
    final uri = Uri.parse(url);
    http.Response req = await http.post(uri, body: body, headers: header);
    return req;
  }
}
