// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:miles/core/exports.dart';

class ApiService {
  final String baseUrl;
  final Map<String, String> headers;

  ApiService({required this.baseUrl, this.headers = const {}});

  Future<dynamic> getRequest(String endpoint,
      {Map<String, String>? queryParams}) async {
    final uri =
        Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParams);
    final response = await http
        .get(uri, headers: headers)
        .timeout(const Duration(seconds: 15));

    return _processResponse(response);
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> data) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    final response = await http
        .post(
          uri,
          headers: headers..addAll({'Content-Type': 'application/json'}),
          body: jsonEncode(data),
        )
        .timeout(const Duration(seconds: 15));

    return _processResponse(response);
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communicating with server: ${response.statusCode}');
    }
  }
}

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class BadRequestException extends ApiException {
  BadRequestException(super.message);
}

class UnauthorisedException extends ApiException {
  UnauthorisedException(super.message);
}

class FetchDataException extends ApiException {
  FetchDataException(super.message);
}
