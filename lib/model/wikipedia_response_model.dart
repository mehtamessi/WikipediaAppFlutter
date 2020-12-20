
import 'continue_model.dart';
import 'query_model.dart';

class WikipediaResponse{
  bool _batchcomplete;
  Continue _continue;
  Query _query;

  WikipediaResponse.fromJson(Map<String, dynamic> json) {
    _batchcomplete = json['batchcomplete'];
    _continue = json['continue'] != null ? new Continue(json['continue']) : null;
    _query = json['query'] != null ? new Query(json['query']) : null;
  }

  bool get mBatchComplete => _batchcomplete;
  Continue get ccontinue => _continue;
  Query get mQuery => _query;

  set ccontinue(Continue value) {
    _continue = value;
  }

  set mBatchComplete(bool value) {
    _batchcomplete = value;
  }

  set mQuery(Query value) {
    _query = value;
  }

}