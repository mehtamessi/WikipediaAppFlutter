import 'package:rxdart/rxdart.dart';
import 'package:wikipedia_app/model/wikipedia_response_model.dart';
import 'package:wikipedia_app/persistence/repository.dart';


class WikipediaBloc {
  Repository _repository = Repository();

  //Create a PublicSubject object responsible to add the data which is got from
  // the server in the form of WeatherResponse object and pass it to the UI screen as a stream.
  final _wikipediaFetcher = PublishSubject<WikipediaResponse>();

  //This method is used to pass the weather response as stream to UI
  Observable<WikipediaResponse> get wikipedia => _wikipediaFetcher.stream;

  fetchLondonWeather(String searchKey) async {
    print("KEY__________"+searchKey);
    WikipediaResponse weatherResponse = await _repository.fetchLondonWeather(searchKey);
    _wikipediaFetcher.sink.add(weatherResponse);
  }

  dispose() {
    //Close the weather fetcher
    _wikipediaFetcher.close();
  }
}

final wikipediaBloc = WikipediaBloc();
