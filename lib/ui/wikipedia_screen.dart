import 'package:flutter/material.dart';
import 'package:wikipedia_app/bloc/wikipedia_bloc.dart';
import 'package:wikipedia_app/model/wikipedia_response_model.dart';

class WikipediaScreen extends StatefulWidget {
  String searchKey;

  WikipediaScreen({Key key, @required this.searchKey}) : super(key: key);

  @override
  _WikipediaScreenState createState() => _WikipediaScreenState();
}

class _WikipediaScreenState extends State<WikipediaScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("InitStatekey-----"+widget.searchKey);
  }

  @override
  Widget build(BuildContext context) {
    print("BuildStatekey-----" + widget.searchKey);

    wikipediaBloc.fetchLondonWeather(widget.searchKey);
    return new Scaffold(
      //Here you can set what ever background color you need.
      backgroundColor: Colors.white,
      body: StreamBuilder(
          stream: wikipediaBloc.wikipedia,
          builder: (context, AsyncSnapshot<WikipediaResponse> snapshot) {
            if (snapshot.hasData) {
              return _buildWeatherScreen(snapshot.data);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Container _buildWeatherScreen(WikipediaResponse data) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 60, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildTitle("Wikipedia Response Data"),
          data.mQuery.pages != null
              ? Container(
              padding: const EdgeInsets.fromLTRB(20.0, 10, 10, 20),
                  child: ListView.builder(
                      itemCount: data.mQuery.pages.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                          child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[

                          Text(
                          '${data.mQuery.pages[index].title}',
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          textAlign: TextAlign.left,
                        ),

                               /* Text(
                                  '${data.mQuery.pages[index].terms.description}',
                                  style: TextStyle(color: Colors.black45, fontSize: 10.0),
                                  textAlign: TextAlign.right,
                                ),*/

                              ]));
                      }))
              : Container(
                  child: Text(
                  "please enter valid key",
                  style: TextStyle(color: Colors.black, fontSize: 10.0),
                  textAlign: TextAlign.center,
                )),
        ],
      ),
    );
  }

  Center _buildTitle(String name) {
    return Center(
      child: Text(
        name,
        style: TextStyle(color: Colors.lightBlue, fontSize: 15.0),
        textAlign: TextAlign.center,
      ),
    );
  }
/*
  Column _buildCoord(Continue coord) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Coord",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Lat: " + coord.lat.toString()),
            _buildVerticalDivider(),
            Text("Lng: " + coord.lon.toString())
          ],
        ),
      ],
    );
  }

  Column _buildMain(Main main) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Main",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Text("Temperature: " + main.temp.toString()),
        Text("Pressure: " + main.pressure.toString()),
        Text("Humidity: " + main.humidity.toString()),
        Text("Highest temperature: " + main.tempMax.toString()),
        Text("Lowest temperature: " + main.tempMin.toString()),
      ],
    );
  }

  Column _buildWindInfo(Wind wind) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Wind",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Speed: " + wind.speed.toString()),
            _buildVerticalDivider(),
            Text("Degree: " + wind.deg.toString()),
          ],
        )
      ],
    );
  }

  Container _buildVerticalDivider() {
    return Container(
        height: 20, child: VerticalDivider(color: Colors.blueGrey));
  }

  Column _buildSys(Sys sys) {
    final dateFormat = new DateFormat('hh:mm:ss');

    var sunriseDate =
        new DateTime.fromMillisecondsSinceEpoch(sys.sunrise * 1000);
    var sunsetDate = new DateTime.fromMillisecondsSinceEpoch(sys.sunset * 1000);
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(bottom: 12.0),
          child: Text(
            "Sys",
            style: TextStyle(
                color: Color.fromRGBO(0, 123, 174, 100), fontSize: 18.0),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Sunrise: " + dateFormat.format(sunriseDate)),
            _buildVerticalDivider(),
            Text("Sunset: " + dateFormat.format(sunsetDate)),
          ],
        ),
      ],
    );
  }*/
}
