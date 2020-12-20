class Terms {
  List<String> _description;

  Terms(Map<String, dynamic> json) {
    _description = json['description'].cast<String>();
  }

  List<String> get description => _description;

  set description(List<String> value) {
    _description = value;
  }
}