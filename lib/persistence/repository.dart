

import 'package:wikipedia_app/model/wikipedia_response_model.dart';

import 'api_provider.dart';

class Repository {
  ApiProvider appApiProvider = ApiProvider();

  Future<WikipediaResponse> fetchLondonWeather(String searchKey) => appApiProvider.fetchLondonWeather(searchKey);
}
