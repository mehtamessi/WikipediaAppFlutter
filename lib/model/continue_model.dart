
class Continue {

  int _gpsoffset;
  String _continue;

  Continue(parsedJson) {
    _gpsoffset = parsedJson['gpsoffset'];
    _continue = parsedJson['continue'];
  }

  int get gpsoffset => _gpsoffset;
  String get mcontinue => _continue;

  set gpsoffset(int value) {
    _gpsoffset = value;
  }


  set mcontinue(String value) {
    _continue = value;
  }
}