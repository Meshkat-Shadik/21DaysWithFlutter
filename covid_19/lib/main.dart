import 'dart:convert';

import 'package:covid_19/Data/source.dart';
import 'package:covid_19/panels/worldwidePanel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Circular', primaryColor: primaryBlack),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }

  Future fetchData() async {
    fetchWorldWideData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Tracker'),
      ),
      body: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: fetchData,
          child: Column(
            children: <Widget>[
              TopContainer(),
              worldData != null
                  ? WorldWidePanel(worldData)
                  : CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class TopContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 60,
      color: Colors.orange[100],
      child: Text(
        DataSource.quote,
        style: TextStyle(
            color: Colors.orange[800],
            fontWeight: FontWeight.bold,
            fontSize: 16),
      ),
    );
  }
}
