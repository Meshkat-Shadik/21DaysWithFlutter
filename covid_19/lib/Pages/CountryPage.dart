import 'dart:convert';

import 'package:covid_19/Data/source.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  List countryData;
  fetchCountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchCountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country Statistics')),
      body: countryData == null
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: countryData == null ? 0 : countryData.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    height: 150,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300],
                          blurRadius: 10,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  countryData[index]['country'],
                                  style: TextStyle(fontSize: 25),
                                  textAlign: TextAlign.left,
                                ),
                                Container(
                                  // margin: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[200],
                                        offset: Offset(3, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 20,
                                        spreadRadius: -20,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                      radius: 48.0,
                                      backgroundImage: NetworkImage(
                                          countryData[index]['countryInfo']
                                              ['flag']),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'CONFIRMED:' +
                                    countryData[index]['cases'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Text(
                                'ACTIVE:' +
                                    countryData[index]['active'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                              Text(
                                'RECOVERED:' +
                                    countryData[index]['recovered'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              Text(
                                'DEATHS:' +
                                    countryData[index]['deaths'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey[100]
                                        : Colors.grey[900]),
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  onTap: () {
                    Alert(
                      context: context,
                      image: Image.network(
                          countryData[index]['countryInfo']['flag']),
                      title: countryData[index]['country'],

                      content: Card(
                        child: Column(
                          children: <Widget>[
                            Text('TODAY\'s Statistics',
                                style: TextStyle(fontSize: 16)),
                            Divider(thickness: 1, color: Colors.grey[500]),
                            MyRow('Today Cases',
                                countryData[index]['todayCases'].toString(),Colors.blue),
                            MyRow('Today Deaths',
                                countryData[index]['todayDeaths'].toString(),Colors.red),
                            MyRow(
                                'Today Recovered',
                                countryData[index]['todayRecovered']
                                    .toString(),Colors.green),
                            SizedBox(height: 5),
                            Text('TOTAL Statistics',
                                style: TextStyle(fontSize: 16)),
                            Divider(thickness: 1, color: Colors.grey[500]),
                            MyRow('Total Cases',
                                countryData[index]['cases'].toString(),Colors.blue),
                            MyRow('Total Deaths',
                                countryData[index]['deaths'].toString(),Colors.red),
                            MyRow('Total Recovered',
                                countryData[index]['recovered'].toString(),Colors.green),
                            SizedBox(height: 5),
                            Text('Country INFO',
                                style: TextStyle(fontSize: 16)),
                            Divider(thickness: 1, color: Colors.grey[500]),
                            MyRow('Total Population',
                                countryData[index]['population'].toString(),Colors.black),
                            MyRow('Continent',
                                countryData[index]['continent'].toString(),Colors.black),
                          ],
                        ),
                      ),
                      style: alertStyle,
                      // desc: "Your Score is $x",
                      buttons: [
                        DialogButton(
                          child: Text(
                            "okay",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => {
                            Navigator.pop(context),
                          },
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(116, 116, 191, 1.0),
                            Color.fromRGBO(52, 138, 199, 1.0)
                          ]),
                        ),
                      ],
                    ).show();
                  },
                );
              },
            ),
    );
  }
}

class MyRow extends StatelessWidget {
  final String title, value;
  final Color colour;
  MyRow(this.title, this.value, this.colour);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[Text(title + ' : '), Text(value,style: TextStyle(color: colour),)],
    );
  }
}
