import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';
import '../models/network_response.dart';

class NetworkCaller {
  final String _defaultErrorMassage = 'Something went wrong';
  final String _unAuthorizeMassage = 'Un-authorize token';
  final Logger _logger = Logger();

  final VoidCallback onUnAuthorize;
  final String accessToken;

  NetworkCaller({required this.onUnAuthorize, required this.accessToken});

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);

      final Map<String, String> headers = {'token': accessToken,
      };

      _logRequest(url, null, headers);
      Response response = await get(uri, headers: headers);
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        onUnAuthorize();
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: _unAuthorizeMassage,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': accessToken,
        // 'Authorization': 'Bearer $accessToken',

      };

      _logRequest(url, body, headers);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      final decodedjson = jsonDecode(response.body);


      if (response.statusCode == 200 || response.statusCode == 201) {
        // TODO sobcisu jsonEncode akare ase
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        if (isFromLogin == false) {
          onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: _unAuthorizeMassage,
          body: decodedjson,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
          body: decodedjson,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, String>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': accessToken,
        // 'Authorization': 'Bearer $accessToken',

      };

      _logRequest(url, body, headers);
      Response response = await patch(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        if (isFromLogin == false) {
          onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: _unAuthorizeMassage,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, String>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': accessToken,
        // 'Authorization': 'Bearer $accessToken',

      };

      _logRequest(url, body, headers);
      Response response = await put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        if (isFromLogin == false) {
          onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: _unAuthorizeMassage,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, String>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      final Map<String, String> headers = {
        'content-type': 'application/json',
        'token': accessToken,
        // 'Authorization': 'Bearer $accessToken',

      };

      _logRequest(url, body, headers);
      Response response = await delete(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      if (response.statusCode == 200) {
        // TODO sobcisu jsonEncode akare ase
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          body: decodedjson,
        );
      } else if (response.statusCode == 401) {
        if (isFromLogin == false) {
          onUnAuthorize();
        }
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: _unAuthorizeMassage,
        );
      } else {
        final decodedjson = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMassage: decodedjson['data'] ?? _defaultErrorMassage,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMassage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  ) {
    _logger.i(
      '==================Request================\n'
      'URL: $url\n'
      'HEADERS: $headers\n'
      'BODY: $body\n'
      '=================================',
    );
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      '=================Response=================\n'
      'URL: $url\n'
      'STATUS CODE: ${response.statusCode}\n'
      'BODY: ${response.body}\n'
      '=================================',
    );
  }
}
