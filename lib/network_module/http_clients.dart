import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'api_base.dart';
import 'api_exceptions.dart';

class HttpClient {
  static final HttpClient _singleton = HttpClient();

  static HttpClient get instance => _singleton;

  Future<dynamic> fetchData(String url, {Map<String, String>? params}) async {
    var responseJson;

    var uri = Uri.parse(APIBase.baseURL +
        url +
        ((params != null) ? queryParameters(params) : ""));
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.get(uri, headers: header);
      print(response.body.toString());
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> fetchProductData(String url,
      {Map<String, String>? params}) async {
    var responseJson;
    var uri = Uri.parse(APIBase.baseProdURL +
        url +
        ((params != null) ? queryParameters(params) : ""));
    try {
      final response = await http.get(uri);
      // print(response.body.toString());
      // print('Product response');
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> postData(String url, dynamic body) async {
    var responseJson;
    var header = {HttpHeaders.contentTypeHeader: 'application/json'};
    try {
      final response = await http.post((APIBase.baseURL + url) as Uri,
          body: body, headers: header);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  String queryParameters(Map<String, String> params) {
    if (params != null) {
      final jsonString = Uri(queryParameters: params);
      return '?${jsonString.query}';
    }
    return '';
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
