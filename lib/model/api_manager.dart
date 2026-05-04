import 'package:http/http.dart' as http;
import 'package:news_app/model/api_constants.dart';

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=54b623f608a14c319c0fcd77d99bcff6

  void getSources() {
    Uri url = Uri.http(ApiConstants.baseUrl, ApiConstants.sourceApi);
    http.get(url);
  }
}
