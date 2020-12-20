class Redirects {
  int _index;
  String _from;
  String _to;

  Redirects(Map<String, dynamic> json) {
    _index = json['index'];
    _from = json['from'];
    _to = json['to'];
  }

  int get index => _index;
  String get from => _from;
  String get to => _to;

  set index(int value) {
    _index = value;
  }
  set from(String value) {
    _from = value;
  }
  set to(String value) {
    _to = value;
  }
}