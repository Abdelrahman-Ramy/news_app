import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/api_constants.dart';
import 'package:news_app/model/source_response.dart';

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=54b623f608a14c319c0fcd77d99bcff6

  static Future<SourceResponse?> getSources() async {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.sourceApi, {
      'apiKey': '54b623f608a14c319c0fcd77d99bcff6',
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
      // return SourceResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
