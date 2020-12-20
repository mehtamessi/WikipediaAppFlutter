
import 'pages_model.dart';
import 'redirect_model.dart';

class Query {

 // List<Redirects> _redirects;
  List<Pages> _pages;

  Query(parsedJson) {

  /*  if (parsedJson['redirects'] != null) {
      _redirects = new List<Redirects>();
      parsedJson['redirects'].forEach((v) { _redirects.add(new Redirects(v)); });
    }*/
    if (parsedJson['pages'] != null) {
      _pages = new List<Pages>();
      parsedJson['pages'].forEach((v) { _pages.add(new Pages(v)); });
    }

  }

  //List<Redirects> get redirects => _redirects;
  List<Pages> get pages => _pages;

 /* set redirects(List<Redirects> value) {
    _redirects = value;
  }*/
  set pages(List<Pages> value) {
    _pages = value;
  }

}