
class Thumbnail {
  String _source;
  int _width;
  int _height;

  //Thumbnail({this.source, this.width, this.height});

  Thumbnail(Map<String, dynamic> json) {
    _source = json['source'];
    _width = json['width'];
    _height = json['height'];
  }

  String get source => _source;
  int get width => _width;
  int get height => _height;

  set source(String value) {
    _source = value;
  }
  set width(int value) {
    _width = value;
  }
  set height(int value) {
    _height = value;
  }
}