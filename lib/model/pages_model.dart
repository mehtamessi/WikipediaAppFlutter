import 'package:wikipedia_app/model/term_model.dart';

import 'thumnail_model.dart';

class Pages {
  int _pageid;
  int _ns;
  String _title;
  int _index;
  Thumbnail _thumbnail;
  Terms _terms;

  Pages(Map<String, dynamic> json) {
    _pageid = json['pageid'];
    _ns = json['ns'];
    _title = json['title'];
    _index = json['index'];
    _thumbnail = json['thumbnail'] != null ? new Thumbnail(json['thumbnail']) : null;
    _terms = json['terms'] != null ? new Terms(json['terms']) : null;
  }
  int get pageid => _pageid;
  int get ns => _ns;
  String get title => _title;
  int get index => _index;
  Thumbnail get thumbnail => _thumbnail;
  Terms get terms => _terms;

  set pageid(int value) {
    _pageid = value;
  }
  set ns(int value) {
    _ns = value;
  }
  set title(String value) {
    _title = value;
  }
  set index(int value) {
    _index = value;
  }
  set thumbnail(Thumbnail value) {
    _thumbnail = value;
  }
  set terms(Terms value) {
    _terms = value;
  }

}
