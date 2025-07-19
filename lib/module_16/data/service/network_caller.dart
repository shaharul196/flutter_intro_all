import 'dart:convert';

import 'package:http/http.dart' ;

class NetworkResponse {
  final bool isSuccess;
  final int statusCode;
  final Map<String, dynamic>? body;
  final String? errorMassage;

  NetworkResponse({
    required this.isSuccess,
    required this.statusCode,
    this.body,
    this.errorMassage,
  });
}

class NetworkCaller {
  static const String _defaultErrorMassage = 'Something went wrong';
  static Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await get(uri);
      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch(e){
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage:  e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest({required String url, Map<String, String>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      Response response = await post(
          uri,
          headers: {
            'content-type': 'application/json'
          },
          body: jsonEncode(body)
      );
      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch(e){
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage:  e.toString(),
      );
    }
  }



}

