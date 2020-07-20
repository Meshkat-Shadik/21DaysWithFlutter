import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          
          children: <Widget>[
            Positioned(child: Container(
                color: Colors.blue[100],
            )),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.black,
                  height: 200,
                )),
            Positioned(
                top: 100,
                left: 20,
                right: 20,
                child: Container(
                  color: Colors.green[700],
                  height: 200,
                )),
            Positioned(
                top: 120,
                left: 120,
                right: MediaQuery.of(context).size.width /2.5,
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width / 2),
                      color: Colors.red[600]),
                )),
          ],
        ));
  }
}
